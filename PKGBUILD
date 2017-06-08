# $Id$
# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=batwarn
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple battery warning tool which changes X gamma on low battery"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/batwarn"
license=('MIT')
depends=('libxxf86vm')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('b33d614b72f578d807dc430a7ad537d5')
build() {
	cd "$pkgname-$pkgname-$pkgver"
	sed -i '/-Wl,-R/d' Makefile
	make
}
package() {
	cd "$pkgname-$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${license_dir}"
	install -m 0644 LICENSE "${license_dir}"
	make DESTDIR="$pkgdir" install
	rm -rf $pkgdir/usr/share/batwarn
}
