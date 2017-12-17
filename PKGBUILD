# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
pkgname=usbtop
pkgver=0.2
pkgrel=1
pkgdesc="top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
arch=('x86_64')
url="https://github.com/aguinet/usbtop"
license=('BSD')
depends=('boost-libs' 'libpcap')
makedepends=('boost' 'cmake')
source=("$url/archive/release-$pkgver.tar.gz")
sha256sums=('6283454ccbfecab44276344b6bc1bf74e86808fb9f539ca63eb0447d7741487e')

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
