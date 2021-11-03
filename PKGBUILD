# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
rpkgname=ledmon
pkgname=ledmonutils
pkgver=0.95
pkgrel=3
pkgdesc="Enclosure LED Utilities"
arch=('x86_64')
url="https://github.com/intel/ledmon"
license=('GPL')
provides=('ledmon')
depends=('sg3_utils' 'systemd-libs' 'pciutils')
source=("https://github.com/intel/$rpkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8f3cec0d8f111e68ab2fff4aeb797193523be3753a51c94b22dac867af201ca7')

prepare() {
	cd "$rpkgname-$pkgver"
    ./autogen.sh
}

build() {
	cd "$rpkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --enable-systemd
	make
}

package() {
	cd "$rpkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
