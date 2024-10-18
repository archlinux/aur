# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=cosmocc-bin
pkgver=3.9.4
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
sha512sums=('89f236f75b8a730270b288a3f47a6e540a0b20cdac85c7a91fd00b666b8447a12d715990c06c0e615f56e539a451643caa6a902008e22c62754d7b3523f15cc0'
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
