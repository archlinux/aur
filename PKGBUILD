# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Xentec <xentec@aix0.eu>
# Contributor: Scott Linder <scott.linder18@gmail.com>

pkgname=entityx
pkgver=1.3.0
pkgrel=1
pkgdesc='Fast, type-safe C++ Entity-Component system'
arch=('x86_64')
url='https://github.com/alecthomas/entityx'
license=('MIT')
makedepends=('cmake' 'git' 'ninja')
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENTITYX_BUILD_SHARED=1 \
    -DENTITYX_BUILD_TESTING=1 \
    -Wno-dev \
    -GNinja
  ninja
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/cmake/FindEntityX.cmake" \
    "$pkgdir/usr/share/cmake-3.3/Modules/FindEntityX.cmake"
}

# vim: ts=2 sw=2 et:
