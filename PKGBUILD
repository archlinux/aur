# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=cosmocc-bin
pkgver=3.5.4
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
sha512sums=('32669dd5eeae2749f5f8ff014060f229173695ae70ad1c5c407917774875273c7003eec3dd4741a8af3f5d10565886bb041589c5a44ec38eace4a3db2cfd4d76'
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
