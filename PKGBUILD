# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=xcursor-dmz
pkgver=0.4.4
pkgrel=2
pkgdesc="Style neutral, scalable cursor theme"
arch=('any')
url="https://packages.debian.org/sid/dmz-cursor-theme"
license=('MIT')
groups=('x11')
makedepends=('xorg-xcursorgen')
source=("http://cdn.debian.net/debian/pool/main/d/dmz-cursor-theme/dmz-cursor-theme_${pkgver}.tar.gz")
md5sums=('06fbab13df89c5770ce61b0e3e31e5f6')

build() {
	
	cd $srcdir/dmz-cursor-theme-${pkgver}
	rm -r debian renderpngs.py

	cd DMZ-White/pngs
	./make.sh
	cd ..
	mv xcursors cursors
	rm -r dmz.svg index.theme pngs
	cd ..

	cd DMZ-Black/pngs
	./make.sh
	cd ..
	mv xcursors cursors
	rm -r dmz-aa.svg index.theme pngs
	cd ..



}

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -R "$srcdir/dmz-cursor-theme-${pkgver}/DMZ-White" "$pkgdir/usr/share/icons/"
	cp -R "$srcdir/dmz-cursor-theme-${pkgver}/DMZ-Black" "$pkgdir/usr/share/icons/"
}