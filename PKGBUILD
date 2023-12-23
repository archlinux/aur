# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.9.5
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=(any)
url="https://github.com/Neargye/magic_enum"
license=(MIT)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/magic_enum/archive/v${pkgver}.tar.gz")
sha256sums=('44ad80db5a72f5047e01d90e18315751d9ac90c0ab42cbea7a6f9ec66a4cd679')

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
