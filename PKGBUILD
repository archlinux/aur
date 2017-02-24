# Maintainer: Viktor Hundahl Strate <viktorstrate@gmail.com>

gitname=tinyMediaManager

pkgname=tiny-media-manager
pkgver=2.9.2
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="http://www.tinymediamanager.org"
license=('Apache-2.0')
depends=('libmediainfo' 'jre8-openjdk')
makedepends=('maven')
source=("https://github.com/tinyMediaManager/tinyMediaManager/archive/$gitname-$pkgver.tar.gz"
			  "tinyMediaManager.desktop")
md5sums=('352ce4dc6c9366f5955c2bc0c61735fb'
				 '4a8fd16c1295e18ec4fe9c0a8ad61d87')

build() {
	cd "$gitname-$gitname-$pkgver"
	mvn package
}

package() {
	mkdir -p "$pkgdir/usr/share/$gitname"
	cd "$srcdir/$gitname-$gitname-$pkgver/dist"

	tar -xvf tmm_"$pkgver"_*_linux.tar.gz
	rm tmm_"$pkgver"_*_linux.tar.gz

	cp -r * "$pkgdir/usr/share/$gitname"
	chmod -R 777 "$pkgdir/usr/share/$gitname"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
}
