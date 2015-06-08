# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjobwidgets-git
pkgver=r63.fe7f90f
pkgrel=1
pkgdesc='KJobWidgets'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kjobwidgets'
license=('LGPL')
depends=('kcoreaddons-git' 'kwidgetsaddons-git' 'qt5-x11extras')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kjobwidgets)
provides=(kjobwidgets)
source=('git://anongit.kde.org/kjobwidgets.git')
md5sums=('SKIP')

pkgver() {
  cd kjobwidgets
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kjobwidgets \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
