# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kconfigwidgets-git
pkgver=r119.e6e1945
pkgrel=1
pkgdesc='Widgets for KConfig'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kconfigwidgets'
license=('LGPL')
depends=('kauth-git' 'kcodecs-git' 'kconfig-git' 'kguiaddons-git' 'ki18n-git'
         'kwidgetsaddons-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
groups=('kf5')
conflicts=(kconfigwidgets)
provides=(kconfigwidgets)
source=('git://anongit.kde.org/kconfigwidgets.git')
md5sums=('SKIP')

pkgver() {
  cd kconfigwidgets
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kconfigwidgets \
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
