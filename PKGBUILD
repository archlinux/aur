# Maintainer: tomwei7 <tomwei7g@gmail.com>
pkgname=zonefs-tools
pkgver=1.5.0
pkgrel=1
pkgdesc="This project provides the mkzonefs command line utility which allows formatting zoned block devices for use withe the zonefs file system."
arch=("x86_64")
url="https://github.com/damien-lemoal/zonefs-tools"
license=("GPL")
changelog=$pkgname.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/damien-lemoal/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("75c00e15d263122486342d96ee38b487")
depends=("glibc" "util-linux-libs")

build() {
	cd "$pkgname-$pkgver"
    ./autogen.sh && ./configure --prefix=/usr
    make -j$(nproc)
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
    mv $pkgdir/usr/sbin $pkgdir/usr/bin
}
