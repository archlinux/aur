# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdelibs
pkgver=1.1.2
pkgrel=5
pkgdesc="Historical copy of the libraries module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/historical/kde1-kdelibs"
license=("GPL2" "LGPL2")
groups=('kde1')
depends=('qt1' 'libpng' 'libjpeg-turbo' 'libtiff')
makedepends=('cmake')
_commit="cc31c174ab60ceeb53552cec121aecdf26a52db3"
source=("https://invent.kde.org/historical/$pkgname/-/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('78d2d66a60009ef3ae98088b4f8b742f01814cf0ad7befd2d7dc3481110399e462070d8240f6f225e44a845905fa3d6ea8f90c55542c50a72e49bfb26a5a55a0')

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake ../$pkgname-$_commit \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd ../$pkgname-$_commit
  install -Dm644 COPYING \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYING.LIB \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING.LIB
}

# vim:set ts=2 sw=2 et:
