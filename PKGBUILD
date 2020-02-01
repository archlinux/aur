# Maintainer: neeshy <neeshy@tfwno.gf>

pkgname=bdf-unifont-extra
pkgver=12.1.04
pkgrel=1
pkgdesc="GNU Unifont Glyphs (bold and italic versions)"
arch=('any')
url="http://unifoundry.com/unifont.html"
license=('custom' 'GPL2')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('mkbold-mkitalic')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.bdf.gz"{,.sig}
        "http://unifoundry.com/LICENSE.txt")
sha256sums=('bab15252ad82d20d5b107965f3b31de9efbce82f0a3f0b7bbf6dd142e42b0710'
            'SKIP'
            '95d93c1634f6982250d51940ff5c81b93a657c295b5c24dfa4214a13c6100495')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

prepare() {
  cd "$srcdir"
  local _type
  for _type in bold italic bolditalic; do
    "mk$_type" "unifont-$pkgver.bdf" > "unifont-$_type-$pkgver.bdf"
  done
}

package() {
  cd "$srcdir"
  local _type
  for _type in bold italic bolditalic; do
    install -Dm644 "unifont-$_type-$pkgver.bdf" \
      "$pkgdir/usr/share/fonts/misc/unifont-$_type.bdf"
  done
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
