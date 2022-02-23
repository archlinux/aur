# Maintainer: nobodyinperson <nobodyinperson at posteo de>

pkgname=thunderbird-markdown-here-revival
pkgver=3.3.0
pkgrel=1
pkgdesc="A revival of the popular Markdown-Here addon for Thunderbird 78 and beyond"
arch=(any)
url="https://addons.thunderbird.net/en-US/thunderbird/addon/markdown-here-revival/"
license=(MIT)
makedepends=(jq libarchive)
depends=(thunderbird)
source=("${pkgname#thunderbird-}-$pkgver.xpi::https://addons.thunderbird.net/thunderbird/downloads/latest/markdown-here-revival/addon-988035-$pkgver.xpi")
sha256sums=('ba55bfc769ffee5355f62c119ea68c1fd46aafa1812220cd276c3ff8fbc80c42')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  _installname="`bsdtar -xOf "${pkgname#thunderbird-}-$pkgver.xpi" manifest.json | jq -r .applications.gecko.id`.xpi"
  install -Dm0644 "${pkgname#thunderbird-}-$pkgver.xpi" "$pkgdir/usr/lib/thunderbird/extensions/$_installname"
}
