# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Wu Xiaotian <yetist@gmail.com>

_target_arch=mips
_target=mips64el-linux-gnu
pkgname="${_target}-linux-api-headers"
pkgver=5.19.2
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace (MIPS64EL target, for the toolchain with GNU C library and multilib ABI)'
arch=('any')
url='https://www.kernel.org'
license=('GPL2')
makedepends=('rsync')
source=("http://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar".{xz,sign})
sha256sums=('48e40a1f5501ec6c40e3c86d3d5319200b688f2d9360f72833084d74801fe63d'
            'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman

build() {
    make -C "linux-${pkgver}" ARCH="$_target_arch" mrproper
}

package() {
    make -C "linux-${pkgver}" INSTALL_HDR_PATH="${pkgdir}/usr/${_target}/" ARCH="${_target_arch}" headers_install
}
