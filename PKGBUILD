# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=kde-now
pkgname=$_gitname-git
pkgver=r174.6a45b94
pkgrel=1
pkgdesc='Google Now alternative for the Plasma Desktop'
arch=(i686 x86_64)
url='http://www.kde.org'
license=(GPL)
depends=(plasma-workspace kimap)
makedepends=(extra-cmake-modules git python)
conflicts=(kde-now)
provides=(kde-now)
source=("git://anongit.kde.org/kde-now.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  rm -fr "$pkgdir"/build
}
