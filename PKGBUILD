# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intelmetool-git
pkgver=1.1.40936.447cb44696a
pkgrel=1
pkgdesc='Tool for working with Intel Management Engine'
arch=('x86_64')
depends=('pciutils')
url='https://review.coreboot.org/cgit/coreboot.git/tree/util/intelmetool'
license=('GPL2')
source=("${pkgname}::git+https://review.coreboot.org/coreboot.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"/util/intelmetool

  VER=$(grep INTELMETOOL_VERSION intelmetool.h | sed -r 's/.*"(.*)".*/\1/')
  echo ${VER}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"/util/intelmetool
  make
}

package() {
  cd "${srcdir}/${pkgname}"/util/intelmetool
  install -Dm755 intelmetool "${pkgdir}"/usr/bin/intelmetool
}
