# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=msg2
pkgver=1.2.0
pkgrel=2
pkgdesc='Output a blue arrow and a bold message'
arch=('x86_64')
url='https://roboticoverlords.org/msg2'
license=('GPL')
makedepends=('cmake' 'ninja')
source=("https://roboticoverlords.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('4834104465f62f0ecec7615e75ca2e50a5e42218854da8f6b022a120937702ac')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/$pkgname.1" \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim: ts=2 sw=2 et:
