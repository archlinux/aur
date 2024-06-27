# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
# Contributor: None
pkgname=qmmp-psf-git
pkgdesc="A plugin for Qmmp (2.1.0 or greater) which supports PSF file. Git version."
pkgver=r36.12e0d3e
pkgrel=1
epoch=0
url="https://github.com/TTK-qmmp/qmmp-psf"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'qt6-tools')
depends=('qmmp' 'qt6-base')
source=(qmmp-psf::git+https://github.com/TTK-qmmp/qmmp-psf.git)
md5sums=('SKIP')

pkgver() {
  cd "qmmp-psf" || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "qmmp-psf" || return
  sed -i "s/#include <stdio.h>/#include <stdio.h>\n#include <unistd.h>/g" ./libpsf/zlib/gzguts.h
}

build() {
  cd "qmmp-psf" || return
  qmake6 PREFIX=/usr INCLUDEPATH=/usr/include/qt6/QtWidgets/
  make
}

package() {
  cd "qmmp-psf" || return
  make INSTALL_ROOT="${pkgdir}" install
}
