# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Bhushan Shah
# Contributor: Antonio Rojas

_pkgname=sddm-kcm
pkgname=$_pkgname-git
pkgver=5.24.90.24.g4d03c42
pkgrel=1
pkgdesc='KDE Config Module for SDDM'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdereview/sddm-kcm/'
license=('GPL')
depends=('kcmutils-git')
makedepends=('git' 'extra-cmake-modules' 'knewstuff')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://invent.kde.org/plasma/sddm-kcm.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:^v::;s:-:.:g'
}

build() {
  mkdir -p build && cd build
  cmake ${srcdir}/${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
