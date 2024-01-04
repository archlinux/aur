# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=cosmocc-bin
pkgver=3.2
pkgrel=1
pkgdesc="cosmopolitan toolchain: build-once run-anywhere c library"
arch=('x86_64' 'aarch64')
url="https://justine.lol/cosmopolitan/index.html"
license=('ISC')
depends=()
makedepends=()
options=("!strip")
source=(
  "https://cosmo.zip/pub/cosmocc/cosmocc-$pkgver.zip"
  "bin-wrapper"
)
noextract=(
  "cosmocc-$pkgver.zip"
)
sha512sums=('16da1ed606948830900b0a04fd78eee0e6608f8ce4fc03b37f64f13e62db297d668c961a93d3ecd3d1135972f6d071c54fa9d600d2b8a5bd4542726ec80fc609'
            'd2bb2bcf5eee88a16f78849fd42a63a65539611a030815a56b19b27a25d9abe0fe3a0a746a58c00a2e468b917d1689f5a0048ddfb73c351f5f71d0d0a7015271')

package() {
  mkdir -p "$pkgdir/opt/cosmocc"
  cd "$pkgdir/opt/cosmocc"
  bsdtar -xf "$srcdir/cosmocc-$pkgver.zip"

  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/opt/cosmocc/bin"
  for bin in cosmo* aarch64-* x86_64-*; do
    cp "$srcdir/bin-wrapper" "$pkgdir/usr/bin/$bin"
  done
}
