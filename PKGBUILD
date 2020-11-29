# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdl2trs
_pkgname=sdltrs
pkgver=1.2.14
_commit=8cd76625
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator (with hardware rendering)"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('SKIP')

build() {
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../$_pkgname-$_commit
  cmake --build .
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_pkgname-$_commit/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
