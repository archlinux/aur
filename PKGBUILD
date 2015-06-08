# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=systemsettings-git
pkgver=r1459.a19881d
pkgrel=1
pkgdesc='KDE system settings'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('kcmutils-git' 'khtml-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('systemsettings' 'kde-workspace<0')
provides=('systemsettings')
source=('git://anongit.kde.org/systemsettings.git')
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
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
