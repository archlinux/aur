# Maintainer: Antonio Rojas <arojas@archlinux.org> 

pkgname=dragonplayer-git
pkgver=r638.a108f61
pkgrel=1
pkgdesc='A multimedia player where the focus is on simplicity, instead of features'
arch=(i686 x86_64)
url='http://kde.org/applications/multimedia/dragon'
license=(GPL)
depends=(kparts)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(kdemultimedia-dragonplayer dragonplayer)
provides=(dragonplayer)
replaces=(dragonplayer-frameworks-git)
source=("git://anongit.kde.org/dragon.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd dragon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../dragon \
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
