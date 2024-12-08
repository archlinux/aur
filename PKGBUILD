# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
rpkgname=ledmon
pkgname=ledmonutils
pkgver=1.1.0
pkgrel=1
pkgdesc="Enclosure LED Utilities"
arch=('x86_64')
url="https://github.com/intel/ledmon"
license=('LGPL-2.1-or-later')
provides=('ledmon')
depends=('sg3_utils' 'systemd-libs' 'pciutils' 'glibc')
makedepends=('systemd' 'autoconf-archive')
source=("https://github.com/intel/$rpkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f626400e41ab1e4317b886db5b5df1afa517e8e4faa80fd4378fd22b0bcd055')

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
