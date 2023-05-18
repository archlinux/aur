# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
rpkgname=ledmon
pkgname=ledmonutils
pkgver=0.97
pkgrel=1
pkgdesc="Enclosure LED Utilities"
arch=('x86_64')
url="https://github.com/intel/ledmon"
license=('GPL')
provides=('ledmon')
depends=('sg3_utils' 'systemd-libs' 'pciutils')
makedepends=('systemd')
source=("https://github.com/intel/$rpkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40ee7e462b78c77468cc2ef356a06c5b6db44747d596dc11532f7b6f378d2d4b')

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
