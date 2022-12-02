# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
rpkgname=ledmon
pkgname=ledmonutils
pkgver=0.96
pkgrel=1
pkgdesc="Enclosure LED Utilities"
arch=('x86_64')
url="https://github.com/intel/ledmon"
license=('GPL')
provides=('ledmon')
depends=('sg3_utils' 'systemd-libs' 'pciutils')
makedepends=('systemd')
source=("https://github.com/intel/$rpkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97534302a60f03b90e69228a6a56096cf3fdfc8eb31fea52a974445268fdf5d9')

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
