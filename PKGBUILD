
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kget-frameworks-git
pkgver=r2733.3336063
pkgrel=1
pkgdesc='KDE Download Manager'
arch=(i686 x86_64)
url='https://www.kde.org/applications/internet/kget/'
license=(GPL)
depends=(kdelibs4support kcmutils knotifyconfig qca-qt5 qgpgme)
makedepends=(extra-cmake-modules git kdoctools python boost kdesignerplugin)
conflicts=(kdenetwork-kget kget)
provides=(kget)
source=("git://anongit.kde.org/kget.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd kget
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kget \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
