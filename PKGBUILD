# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=uclibc-ng
pkgver=1.0.41
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
sha512sums=('15a5d617b6571bdd77e6d66d850ace76f6f4d82ce566b7d1b969e7f83f240c51a1593fb437740be52503273c429280625703806bd8e7028dd7c280af76d36070')

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
