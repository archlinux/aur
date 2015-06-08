# Maintainer: Antonio Rojas

pkgname=sddm-kcm-git
pkgver=r130.5fab0a1
pkgrel=1
pkgdesc="SDDM configuration module for KDE"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdereview/sddm-kcm/'
license=('GPL')
depends=('sddm' 'kio' 'libxcursor')
makedepends=('extra-cmake-modules' 'kdoctools' 'qt5-tools')
conflicts=('sddm-kcm')
provides=('sddm-kcm')
source=("git://anongit.kde.org/sddm-kcm.git")
md5sums=('SKIP')

pkgver() {
  cd sddm-kcm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../sddm-kcm \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

