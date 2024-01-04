# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=ape-bin
_cosmocc_version=3.2
pkgver=1.10
pkgrel=1
pkgdesc="actually portable executable loader"
arch=('x86_64' 'aarch64')
url="https://justine.lol/cosmopolitan/index.html"
license=('ISC')
depends=()
makedepends=()
source=(
  "https://cosmo.zip/pub/cosmocc/cosmocc-${_cosmocc_version}.zip"
  "ape-binfmt.conf"
)
sha512sums=('16da1ed606948830900b0a04fd78eee0e6608f8ce4fc03b37f64f13e62db297d668c961a93d3ecd3d1135972f6d071c54fa9d600d2b8a5bd4542726ec80fc609'
            '4574caf236235ce327341dc4e6b2ef4b001ffb2086b156fd72b80c99733186473f2e07dd1fc605206f1ee8a0d03d5deca8d9b2f72fca44e08762548ea6efff96')
install=ape.install

pkgver() {
  "$srcdir/bin/ape-$CARCH.elf" -h | sed -nE 's/.*version (.*).*/\1/p'
}

package() {
  install -D -m755 "$srcdir/bin/ape-$CARCH.elf" "$pkgdir/usr/bin/ape"
  # Make sure the config filename sorts lexicographically greater than "wine.conf"
  install -D -m644 "$srcdir/ape-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/zzz_ape.conf"
}
