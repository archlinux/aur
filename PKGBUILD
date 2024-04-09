# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
rpkgname=ledmon
pkgname=ledmonutils
pkgver=1.0.0
pkgrel=2
pkgdesc="Enclosure LED Utilities"
arch=('x86_64')
url="https://github.com/intel/ledmon"
license=('GPL')
provides=('ledmon')
depends=('sg3_utils' 'systemd-libs' 'pciutils' 'glibc')
makedepends=('systemd' 'autoconf-archive')
source=("https://github.com/intel/$rpkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2826786cd5e7fe7d32d22e9d209b23124801fec9c3220dcd7fb45706f3818dc5')

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
