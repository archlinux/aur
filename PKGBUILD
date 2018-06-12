# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
pkgname=usbtop
pkgver=0.2
pkgrel=2
pkgdesc="top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
arch=('x86_64')
url="https://github.com/aguinet/usbtop"
license=('BSD')
depends=('boost-libs' 'libpcap')
makedepends=('boost' 'cmake')
source=("$url/archive/release-$pkgver.tar.gz"
        "$url/pull/15.patch")
sha256sums=('6283454ccbfecab44276344b6bc1bf74e86808fb9f539ca63eb0447d7741487e'
            '41cdf78a74a0f6f5ef367a75a24757ab9278a04e955bf57e9e51013ed58c6688')

prepare() {
    cd "$pkgname-release-$pkgver"
    patch -Np1 -i ../15.patch
}

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
