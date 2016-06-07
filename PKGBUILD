# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_digest="http://www.imagemagick.org/download/digest.rdf"
_srcname="ImageMagick"
_srcver=$(curl -s "$_digest" | grep "${_srcname}\-7[0-9\.\-]*\.tar\.xz" | sed 's/[^0-9\.\-]*//g' | sed -r 's/.//;s/.{2}$//')
pkgname=imagemagick-full-doc
pkgver="$(echo ${_srcver} | tr '-' '.')"
pkgrel=3
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc' 'imagemagick-full-doc-git')
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=("$(curl -s ${_digest} | grep -A 5 ${_srcname}-${_srcver}.tar.xz | grep sha256 | grep -oE '>[[:alnum:]]*?<' | sed 's/[><]//g')")

build() {
	cd "$_srcname"-"$_srcver"
	
	./configure --prefix=/usr
}

package() {
	cd "$_srcname"-"$_srcver"
	
	make DESTDIR="$pkgdir/" install-data-html
	
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
