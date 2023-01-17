# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdl2trs
_pkgname=sdltrs
pkgver=1.2.25
_commit=2800d4f8d4c0a986d90217fcaa1039404221129a
pkgrel=1
arch=('x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator (with hardware rendering)"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('SKIP')

build() {
  [[ -d build ]] && rm -r build
  cmake $_pkgname-$_commit \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_pkgname-$_commit/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
