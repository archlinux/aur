# Maintainer: nobodyinperson <nobodyinperson at posteo de>

pkgname=thunderbird-markdown-here-revival
pkgver=3.2.11
pkgrel=1
pkgdesc="A revival of the popular Markdown-Here addon for Thunderbird 78 and beyond"
arch=(any)
url="https://addons.thunderbird.net/en-US/thunderbird/addon/markdown-here-revival/"
license=(MIT)
makedepends=(jq libarchive)
depends=(thunderbird)
source=("${pkgname#thunderbird-}-$pkgver.xpi::https://addons.thunderbird.net/thunderbird/downloads/latest/markdown-here-revival/addon-988035-$pkgver.xpi")
sha256sums=('4eae2fe1fe67f7db6242731ee021a8e7015059b738b645b185155915a3453d66')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  _installname="`bsdtar -xOf "${pkgname#thunderbird-}-$pkgver.xpi" manifest.json | jq -r .applications.gecko.id`.xpi"
  install -Dm0644 "${pkgname#thunderbird-}-$pkgver.xpi" "$pkgdir/usr/lib/thunderbird/extensions/$_installname"
}
