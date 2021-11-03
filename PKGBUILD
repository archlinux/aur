# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=ledmonutils
pkgver=0.95
pkgrel=1
pkgdesc="Enclosure LED Utilities"
arch=('x86_64')
url="https://github.com/intel/ledmon"
license=('GPL')
depends=('sg3_utils' 'systemd-libs' 'pciutils')
source=("https://github.com/intel/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8f3cec0d8f111e68ab2fff4aeb797193523be3753a51c94b22dac867af201ca7')

prepare() {
	cd "$pkgname-$pkgver"
    ./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --enable-systemd
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
