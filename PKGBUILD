# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=ksysguard-git
pkgver=r2800.cbcd0f2
pkgrel=1
pkgdesc='KSysGuard'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('knewstuff-git' 'kdelibs4support-git' 'libksysguard-git' 'lm_sensors')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('ksysguard' 'kdebase-workspace')
provides=('ksysguard')
source=('git://anongit.kde.org/ksysguard.git')
md5sums=('SKIP')

pkgver() {
  cd ksysguard
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ksysguard \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
