# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
realname=PcapPlusPlus
pkgname="${realname,,}"
pkgver=22.05
pkgrel=1
pkgdesc="A multi-platform C++ library for capturing, parsing and crafting of network packets"
arch=("x86_64")
url="https://pcapplusplus.github.io/"
license=('Unlicense')
depends=("libpcap")
source=("$pkgname-$pkgver.tar.gz::https://github.com/seladb/$realname/archive/v$pkgver.tar.gz")
sha256sums=('5f299c4503bf5d3c29f82b8d876a19be7dea29c2aadcb52f2f3b394846c21da9')

build() {
	cd "$realname-$pkgver" || exit 1
	mkdir -p "install"
	./configure-linux.sh --default
	make all
}

package() {
	cd "$realname-$pkgver/Dist" || exit 1
	mkdir -p "$pkgdir/usr/bin"
	cp examples/* "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/include/pcapplusplus"
	cp header/*   "$pkgdir/usr/include/pcapplusplus"
	mkdir -p "$pkgdir/usr/lib/pcapplusplus"
	cp ./*.a      "$pkgdir/usr/lib/pcapplusplus"
}
