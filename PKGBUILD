# Maintainer:
pkgname=wolfclu
pkgver=0.1.5
pkgrel=0
pkgdesc="This is the wolfSSL Command Line Utility (wolfCLU)."
arch=("x86_64")
url="https://github.com/wolfSSL/wolfCLU"
license=("GPL2")
makedepends=("autoconf")
depends=("wolfssl")
provides=("${pkgname}")

_build_directory=wolfCLU-${pkgver}-stable

source=(
	"https://github.com/wolfSSL/wolfCLU/archive/refs/tags/v${pkgver}-stable.tar.gz"
)

sha512sums=(
	"c431439c3f70219a3abe362b991c225ac0a457bcd393ec9bb2e9313147aa96d8093bd32bcd4f7204f157c753077d0b309665c7f03ca96c5c8af529c71424233d"
)

prepare() {
	cd "${srcdir}/${_build_directory}"
	./autogen.sh
	./configure --enable-wolfclu
}

build() {
	cd "${srcdir}/${_build_directory}"
	make -j8
}

check() {
	cd "${srcdir}/${_build_directory}"
	make check
}

package() {
	cd "${srcdir}/${_build_directory}"
	DESTDIR="${pkgdir}" make install
	mkdir -p "$pkgdir/usr/share/man/man1"
	cp -r "$pkgdir/usr/local/share/man/man1" "$pkgdir/usr/share/man"
	rm -rf "$pkgdir/usr/local/share"
}
