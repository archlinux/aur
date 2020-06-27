# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=systemsettings-git
pkgver=r2234.079b7928
pkgrel=1
pkgdesc='KDE system settings'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('kcmutils-git' 'khtml-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
conflicts=('systemsettings' 'kde-workspace<0')
provides=('systemsettings')
source=('git+https://github.com/KDE/systemsettings.git')
groups=('plasma')
md5sums=('SKIP')

pkgver() {
  cd systemsettings
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../systemsettings \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
