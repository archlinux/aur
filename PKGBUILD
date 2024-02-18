# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=bdf-unifont-extra
pkgver=15.1.04
pkgrel=2
pkgdesc="GNU Unifont Glyphs (bold and italic versions)"
arch=('any')
url="https://unifoundry.com/unifont/index.html"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=('mkbold-mkitalic')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.bdf.gz"{,.sig}
        "https://unifoundry.com/LICENSE.txt")
sha256sums=('88e00954b10528407e62e97ce6eaa88c847ebfd9a464cafde6bf55c7e4eeed54'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

build() {
  cd "$srcdir"
  local _type
  for _type in bold italic bolditalic; do
    "mk$_type" "unifont-$pkgver.bdf" | gzip -c >"unifont-$_type-$pkgver.bdf.gz"
  done
}

package() {
  cd "$srcdir"
  local _type
  for _type in bold italic bolditalic; do
    install -Dm644 "unifont-$_type-$pkgver.bdf.gz" \
      "$pkgdir/usr/share/fonts/misc/unifont-$_type.bdf.gz"
  done
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
