# Maintainer: Jaap Aarts <jaap.aarts1@gmail.com>
# Contributor: Sean Anderson <seanga2@gmail.com>
_target=riscv64-linux-uclibc
pkgname=$_target-uclibcng
pkgver=1.0.41
pkgrel=1
epoch=
pkgdesc="A C library for embedded Linux"
arch=(x86_64)
url="https://uclibc-ng.org/"
license=('LGPL2.1')
groups=()
# depends=('linux-headers')
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
	"file://config"
)
noextract=()
sha512sums=('15a5d617b6571bdd77e6d66d850ace76f6f4d82ce566b7d1b969e7f83f240c51a1593fb437740be52503273c429280625703806bd8e7028dd7c280af76d36070'
			'27cfa23791b7eb2e658ca8952309e76a49ec8d162eea93da40d55affbea71f3639fb99d180397e7e2d576af3b0754813d6419e76d67859adad47cc0ad2dce449')


# prepare() {
# 	cd "uClibc-ng-$pkgver"
# 	ARCH=riscv64 make config
# 	sed -i 's,KERNEL_HEADERS.*,KERNEL_HEADERS="/usr/include/",g' .config
# 	sed -i 's,# UCLIBC_HAS_RESOLVER_SUPPORT.*,UCLIBC_HAS_RESOLVER_SUPPORT=y,g' .config
# }

build() {
	cd "uClibc-ng-$pkgver"
	cp ../config .config
	make -j17 ARCH="riscv64" CROSS_COMPILE="riscv64-linux-gnu-" UCLIBC_EXTRA_CFLAGS="-march=rv64imafd" all
}

package() {
	cd "uClibc-ng-$pkgver"
	make PREFIX="$pkgdir" CROSS_COMPILE="riscv64-linux-gnu-" install
}
