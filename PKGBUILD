# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kglobalaccel-git
pkgver=r69.504446f
pkgrel=1
pkgdesc='KGlobalAccel'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kglobalaccel'
license=('LGPL')
depends=('qt5-x11extras' 'kconfig-git' 'kcrash-git' 'kdbusaddons-git' 'ki18n-git' 'kwindowsystem-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kglobalaccel)
provides=(kglobalaccel)
source=('git://anongit.kde.org/kglobalaccel.git')
md5sums=('SKIP')

pkgver() {
  cd kglobalaccel
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kglobalaccel \
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
