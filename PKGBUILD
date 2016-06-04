# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname="ImageMagick"
pkgname=imagemagick-full-doc
pkgver=7.0.1.9
pkgrel=1
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc' 'imagemagick-full-doc-git')
source=("http://www.imagemagick.org/download/ImageMagick.tar.xz")
sha256sums=("$(curl -s http://www.imagemagick.org/download/digest.rdf | grep -A 5 ImageMagick.tar.xz | grep sha256 | grep -oE '>[[:alnum:]]*?<' | sed 's/[><]//g')")

pkgver() {
	_srcver=$(tar -tf ImageMagick.tar.xz | head -1 | cut -f1 -d"/" | sed 's/[^0-9\.-]*//g' | cut -c 2-)
	printf "%s" "$(echo ${_srcver} | tr '-' '.')"
}

build() {
	_srcver=$(tar -tf ImageMagick.tar.xz | head -1 | cut -f1 -d"/" | sed 's/[^0-9\.-]*//g' | cut -c 2-)
	cd "$_srcname"-"$_srcver"
	
	./configure --prefix=/usr
}

package() {
	_srcver=$(tar -tf ImageMagick.tar.xz | head -1 | cut -f1 -d"/" | sed 's/[^0-9\.-]*//g' | cut -c 2-)
	cd "$_srcname"-"$_srcver"
	
	make DESTDIR="$pkgdir/" install-data-html
	
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
