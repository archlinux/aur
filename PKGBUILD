# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=amdctl-git
pkgver=0.11.r0.ga10ccd0
pkgrel=1
pkgdesc="Set P-State voltages and clock speeds on recent AMD CPUs on Linux.
         Currently supported families are: 10h, 11h, 12h, 14h, 15h, 16h, 17h, 19h"
arch=(i686 x86_64)
conflicts=(amdctl)
url="https://github.com/kevinlekiller/amdctl"
license=(GPL3)
depends=(glibc)
makedepends=(git)
source=("git+https://github.com/kevinlekiller/amdctl.git"
        'amdctl.conf')
sha256sums=('SKIP'
            'a3e2ebec196914ff59fec2683bd2ce900d767979620411cd724138e1ca42701c')

pkgver() {
  cd "${srcdir}/amdctl"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/amdctl"
  make
}

package() {
  cd "${srcdir}/amdctl"
  install -Dm755 amdctl -t "${pkgdir}/usr/bin/"
  install -Dm755 ../amdctl.conf -t "${pkgdir}/etc/modules-load.d/"
}
