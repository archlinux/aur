# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=cosmocc-bin
pkgver=3.6.2
pkgrel=2
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
sha512sums=('a9686b55db1df16e94ddd8a110eb2ea34f10b684bafabd7a04d0ba329cf3b5b43871e3f77d269428888d4be09642fcf419abe1eac85aa922060847264257107a'
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
