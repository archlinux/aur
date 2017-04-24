# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=kdiff
pkgname=${_pkgname}-git
pkgver=r10.15fca24
pkgrel=2
pkgdesc="Graphical difference viewer for the KDE platform. (GIT version)"
arch=('x86_64')
url="https://github.com/jsalatas/kdiff"
license=('GPL' 'LGPL')
depends=('ktexteditor')
makedepends=('extra-cmake-modules' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/jsalatas/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
