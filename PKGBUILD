# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libksysguard-git
pkgver=r1507.e52a86f
pkgrel=2
pkgdesc='Libksysguard'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('libxres' 'plasma-framework-git' 'qt5-webkit')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
provides=('libksysguard')
conflicts=('libksysguard' 'kdebase-workspace')
source=('git://anongit.kde.org/libksysguard.git')
md5sums=('SKIP')

pkgver() {
  cd libksysguard
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libksysguard \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
