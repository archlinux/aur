# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.9.3
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=(any)
url="https://github.com/Neargye/magic_enum"
license=(MIT)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/magic_enum/archive/v${pkgver}.tar.gz")
sha256sums=('3cadd6a05f1bffc5141e5e731c46b2b73c2dbff025e723c8abaa659e0a24f072')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check(){
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
