# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=uclibc-ng
pkgver=1.0.44
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
sha512sums=('46ec105ed74131c4e37c0b5277177afedaecbec464a8942f4fffbdca1be09bbdde9762e622dfc5b9216a652bf50efef0a6d7126c37974d4c8156011a736d555b')

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
