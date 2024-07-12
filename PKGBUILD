# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=ape-bin
pkgver=1.10
pkgrel=2
pkgdesc="actually portable executable loader"
arch=('x86_64' 'aarch64')
url="https://justine.lol/cosmopolitan/index.html"
license=('ISC')
depends=()
makedepends=()
source=(
  "ape-binfmt.conf"
)
source_x86_64=(
  "https://cosmo.zip/pub/cosmos/v/3.3.1/bin/ape-x86_64.elf"
)
source_aarch64=(
  "https://cosmo.zip/pub/cosmos/v/3.3.1/bin/ape-aarch64.elf"
)
sha256sums=('3e9c148ca8aeed687ec05bc06fea954b08cf4fff9044a06ab19a0e48c4dc8e17')
sha256sums_x86_64=('7c1cf8b24e1b6dd6ad7da3817045d582ada146b4d6ec0c6a45bea830e3a65f4d')
sha256sums_aarch64=('877ccbd465243065426cb4a3cab4351acad918649f8656556bb604882eead08f')
install=ape.install

pkgver() {
  chmod +x "$srcdir/ape-$CARCH.elf"
  "$srcdir/ape-$CARCH.elf" -h | sed -nE 's/.*version (.*).*/\1/p'
}

package() {
  install -D -m755 "$srcdir/ape-$CARCH.elf" "$pkgdir/usr/bin/ape"
  # Make sure the config filename sorts lexicographically greater than "wine.conf"
  install -D -m644 "$srcdir/ape-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/zzz_ape.conf"
}
