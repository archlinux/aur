# Maintainer: nobodyinperson <nobodyinperson at posteo de>

pkgname=thunderbird-markdown-here-revival
pkgver=3.4.4
pkgrel=0
pkgdesc="A revival of the popular Markdown-Here addon for Thunderbird 78 and beyond"
arch=(any)
url="https://addons.thunderbird.net/en-US/thunderbird/addon/markdown-here-revival/"
license=(MIT)
makedepends=(jq libarchive)
depends=(thunderbird)
source=("${pkgname#thunderbird-}-$pkgver.xpi::https://addons.thunderbird.net/thunderbird/downloads/file/1021734/markdown_here_revival-$pkgver-tb.xpi")
sha256sums=('c4bc1f81fd8db01e9a1600d5c4092d82d5d3d64eb5ca9e1f69d2152088bcb364')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  _installname="`bsdtar -xOf "${pkgname#thunderbird-}-$pkgver.xpi" manifest.json | jq -r .applications.gecko.id`.xpi"
  install -Dm0644 "${pkgname#thunderbird-}-$pkgver.xpi" "$pkgdir/usr/lib/thunderbird/extensions/$_installname"
}
