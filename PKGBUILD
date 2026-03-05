# Contributor: Asger Hautop Drewsen <asger@tyilo.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=cosmocc-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="cosmopolitan toolchain: build-once run-anywhere c library"
arch=('x86_64' 'aarch64')
url="https://justine.lol/cosmopolitan/index.html"
license=('ISC')
depends=()
makedepends=()
options=('!strip')
source=(
  "https://cosmo.zip/pub/cosmocc/cosmocc-$pkgver.zip"
  "bin-wrapper"
)
noextract=(
  "cosmocc-$pkgver.zip"
)
sha512sums=('e4361ed69528f47abc7336474871c5177734b88aebdf7b625b67554dd14fbe7be3d70409b12542c0cd3b48f7a17d54d340a09acffa7d024f1ea2073f429fab69'
            'd2bb2bcf5eee88a16f78849fd42a63a65539611a030815a56b19b27a25d9abe0fe3a0a746a58c00a2e468b917d1689f5a0048ddfb73c351f5f71d0d0a7015271')

package() {
  install -dm755 "$pkgdir/opt/cosmocc"
  cd "$pkgdir/opt/cosmocc"
  bsdtar -xf "$srcdir/cosmocc-$pkgver.zip"
  chmod -R 755 "$pkgdir/opt"

  install -dm755 "$pkgdir/usr/bin"
  for bin in cosmo* aarch64-* x86_64-*; do
    cp "$srcdir/bin-wrapper" "$pkgdir/usr/bin/$bin"
  done
}
