# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Valentín Kivachuk <vk18496@gmail.com>

_target_arch=mips
_target=mips64-linux-gnu
pkgname="${_target}-linux-api-headers"
pkgver=6.14.4
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace (MIPS64 target, for the toolchain with GNU C library and multilib ABI)'
arch=('any')
url='https://www.kernel.org'
license=('GPL-2.0-only')
makedepends=('rsync')
source=("http://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar".{xz,sign})
sha256sums=('9452f28d7a0051fba4886712395b484c4c7fcf9f85944a62fd3d97dc923f5339'
            'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman

build() {
    make -C "linux-${pkgver}" ARCH="$_target_arch" mrproper
}

package() {
    make -C "linux-${pkgver}" INSTALL_HDR_PATH="${pkgdir}/usr/${_target}/" ARCH="${_target_arch}" headers_install
}
