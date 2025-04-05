# Maintainer:
pkgname=wolfclu
pkgver=0.1.8
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
	"711e121a9953164301cc3ec134d02850cfb39404cee27ec359fcd18d74eb677e52591fa5d0c44887b6ecf57dcfd353442c16527a1ce869050e0ced1021a9442c"
)

prepare() {
	cd "${srcdir}/${_build_directory}"
	./autogen.sh
	./configure --prefix=/usr
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
}
