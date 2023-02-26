# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
pkgname=qmmp-psf-git
pkgdesc="A plugin for Qmmp (2.1.0 or greater) which supports PSF file. Git version."
pkgver=r32.06f2d36
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
  cd "qmmp-psf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "qmmp-psf"
  sed -i 's/qmmp-1/qmmp/g' ./psf.pro
}

build() {
  cd "qmmp-psf"
  qmake6 PREFIX=/usr INCLUDEPATH=/usr/include/qt6/QtWidgets/
  make
}

package() {
  cd "qmmp-psf"
  make INSTALL_ROOT="${pkgdir}" install
}
