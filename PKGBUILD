# Maintainer: Antonio Rojas 

pkgname=kile-frameworks-git
pkgver=r2794.95ba610
pkgrel=1
pkgdesc='A user friendly TeX/LaTeX frontend for KDE'
arch=(i686 x86_64)
url='http://kile.sourceforge.net/'
license=(GPL)
depends=(kinit ktexteditor okular-frameworks-git)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(kile)
provides=(kile)
source=("git://anongit.kde.org/kile.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd kile
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kile \
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
