# Maintainer: Furkan Kardame <furkan@fkardame.com>

pkgname=qqc2-suru-style-git
_pkgname=qqc2-suru-style
pkgver=r81.4bd56af
pkgrel=1
pkgdesc="Suru style for QtQuick Controls 2"
arch=('x86_64' 'armv7' 'aarch64')
url="https://github.com/ubports/qqc2-suru-style.git"
license=('GPL3')
depends=(qt5-base qt5-declarative qt5-quickcontrols2)
makedepends=('git')
source=('git+https://github.com/ubports/qqc2-suru-style.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd ${_pkgname}
#  patch -Np1 -i "${srcdir}/0001-dont-replace-upstream-qmltermwidget.patch"
}

build() {
  cd ${_pkgname}
  qmake CONFIG+=no_docs
  make
}

package() {
  cd ${_pkgname}
  make INSTALL_ROOT="${pkgdir}/" install
}
