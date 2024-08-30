# Maintainer: Jaap Aarts <jaap.aarts1@gmail.com>
# Contributor: Sean Anderson <seanga2@gmail.com>
_target=riscv64-linux-uclibc
pkgname=$_target-uclibcng
pkgver=1.0.50
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
sha512sums=('a478cbef1160f12a5ff7453f7b6f9c9d8df49c1421b660cb8e9e2a3b792a662ad0793dc9cec7c00490628f46eaadbe9ec578dd8ea86fc27b0069d1f075422612'
            'e48bfefa1a722c4f435d5f2ef0d899450d059ecd06cfe7e5400029f3b5a79f7c7f7ff5bbe8f46f4fc42f5c4831d0a742e427922254ee30abcbfe807f5a3117ef')

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
