# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
pkgname=usbtop
pkgver=0.1
pkgrel=1
pkgdesc="top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
arch=('i686' 'x86_64')
url="https://github.com/aguinet/usbtop"
license=('BSD')
depends=('boost-libs' 'libpcap')
makedepends=('boost' 'cmake')
source=("$url/archive/release-$pkgver.tar.gz")
sha256sums=('93456007b8a6f652e104f552ee2f07a68581be86866cfc6fcd31ddb7310200d9')

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
