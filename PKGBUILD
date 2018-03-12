# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kholidays
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc="KDE library for regional holiday information"
arch=('any')
url="https://projects.kde.org/projects/kde/pim/$_gitname"
license=('LGPL')
depends=('kdelibs4support')
makedepends=('extra-cmake-modules-git' 'git' 'python')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://anongit.kde.org/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p ${srcdir}/${_pkgname}/build
}

build() {
  cd ${srcdir}/${_pkgname}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd ${srcdir}/${_pkgname}/build
  make DESTDIR="${pkgdir}" install
}
