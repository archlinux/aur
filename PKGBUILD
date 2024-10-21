# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=uclibc-ng
pkgver=1.0.50
pkgrel=1
epoch=
pkgdesc="A C library for embedded Linux"
arch=(x86_64)
url="https://uclibc-ng.org/"
license=('LGPL2.1')
groups=()
depends=('linux-headers')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('staticlibs')
install=
changelog=
source=(
	"https://downloads.uclibc-ng.org/releases/$pkgver/uClibc-ng-$pkgver.tar.xz"
)
noextract=()
sha512sums=('a478cbef1160f12a5ff7453f7b6f9c9d8df49c1421b660cb8e9e2a3b792a662ad0793dc9cec7c00490628f46eaadbe9ec578dd8ea86fc27b0069d1f075422612')

prepare() {
	cd "uClibc-ng-$pkgver"
	ARCH=x86_64 make defconfig
	sed -i 's,KERNEL_HEADERS.*,KERNEL_HEADERS="/usr/include/",g' .config
	sed -i 's,# UCLIBC_HAS_RESOLVER_SUPPORT.*,UCLIBC_HAS_RESOLVER_SUPPORT=y,g' .config
}

build() {
	cd "uClibc-ng-$pkgver"
	make all
}

package() {
	cd "uClibc-ng-$pkgver"
	make PREFIX="$pkgdir" install
}
