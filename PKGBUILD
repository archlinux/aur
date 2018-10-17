# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=msg2
pkgver=1.0.1
pkgrel=2
pkgdesc='Output a blue arrow and a white message'
arch=('x86_64')
url='https://roboticoverlords.org/msg2'
license=('GPL')
makedepends=('cmake' 'ninja')
source=("https://roboticoverlords.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('cd70e516723f47a371f8f89e16f40309b618b36d614bb8fec7644559ad328671')

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

