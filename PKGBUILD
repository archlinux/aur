# Maintainer: tomwei7 <tomwei7g@gmail.com>
pkgname=libzbc
pkgver=5.9.0
pkgrel=1
pkgdesc="simple library providing functions for manipulating SCSI and ATA devices supporting the Zoned Block Command (ZBC) and Zoned-device ATA command set (ZAC) specifications."
arch=("x86_64")
url="https://github.com/westerndigitalcorporation/libzbc"
license=("GPL3")
changelog=$pkgname.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westerndigitalcorporation/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("ce22f170e9fd414685d3293114207e62")
depends=("glibc")
optdepends=("gtk3")
makedepends=("autoconf-archive")

build() {
	cd "$pkgname-$pkgver"
    ./autogen.sh && ./configure --prefix=/usr --enable-static=no
    make -j$(nproc)
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
