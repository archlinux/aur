# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=bdf-unifont-extra
pkgver=17.0.03
pkgrel=1
pkgdesc="GNU Unifont Glyphs (bold and italic versions)"
arch=('any')
url="https://unifoundry.com/unifont/"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=('mkbold-mkitalic')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.bdf.gz"{,.sig}
        "unifont-LICENSE.txt::https://unifoundry.com/LICENSE.txt")
sha256sums=('30d50302daca631e2cf454d9747117d98c9f35c0b18af4f67d2fa5e116992033'
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
  install -Dm644 unifont-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
