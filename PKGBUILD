# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nebk <nebk2010@gmail.com>
pkgname=uboot-riscv64-qemu
pkgver=2023.01
pkgrel=1
pkgdesc="uboot binary for qemu riscv64 guest linux guest operating systems"
arch=('any')
url="https://github.com/qemu/u-boot"
license=('GPL')
makedepends=('riscv64-linux-gnu-gcc' 'bc' 'dtc' 'python')
options=(!distcc)
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('709202a61294d9c3f003187123dd5626')
sha256sums=('6214cfb022f1b99b1a021eae1e09a9671c464bfa012c43e440f49c19e3595c09')


build() {
    cd u-boot-${pkgver}

    unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS
    export CROSS_COMPILE=riscv64-linux-gnu-
    make qemu-riscv64_smode_defconfig
    make
}

package() {
    cd u-boot-${pkgver}
    install -Dm644 u-boot.bin $pkgdir/usr/share/qemu/u-boot-riscv64.bin
}
