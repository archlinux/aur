# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=qt1
pkgver=1.45
pkgrel=2
pkgdesc="Historical copy of Qt 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/historical/qt1"
license=("custom:Qt Free Edition License")
depends=("libx11" "libxext" "mesa")
makedepends=("cmake" "byacc")
_commit="46b0d20a2823088b8942020b896a3e77376eb29a"
source=("https://invent.kde.org/historical/qt1/-/archive/$_commit/qt1-$_commit.tar.gz")
sha256sums=('08c47fb02f326d58ec55049c12439c09a8e24dd863686c6c29a4075a06d575af')

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake ../"$pkgname-$_commit" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd ../"$pkgname-$_commit"
  install -Dm644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
