# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
pkgname=usbtop
pkgver=1.0
pkgrel=1
pkgdesc="top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
arch=('x86_64')
url="https://github.com/aguinet/usbtop"
license=('BSD')
depends=('boost-libs' 'libpcap')
makedepends=('boost' 'cmake')
source=("$url/archive/release-$pkgver.tar.gz")
sha256sums=('eea7f2fbdcaacbf1097f62f9e4fb50ffd238cec3085b67d384ab0a419274e1da')

build() {
	cd "$pkgname-release-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" .
	make
}

package() {
	cd "$pkgname-release-$pkgver"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
