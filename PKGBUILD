# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=pi-ext-hindsight
pkgver=0.8.6
pkgrel=1
pkgdesc="Hindsight long-term memory for the pi coding agent"
arch=('any')
url="https://hindsight.vectorize.io"
license=('MIT')
depends=('pi-coding-agent')
install=pi-ext-hindsight.install
source=(
  "hindsight-coding-agents-${pkgver}.tgz::https://registry.npmjs.org/@vectorize-io/hindsight-coding-agents/-/hindsight-coding-agents-${pkgver}.tgz"
  'package.json'
  'coding-agent.json.example'
  'LICENSE'
)
sha256sums=('e17a0f1a1c93de0a5ccb7f6e5d2140ef7abac2c794308859c33bcbd4814b1954'
            '747c3ab9e726c19e90bccc5df35b1e3c9dba5ebba2a7470232cabb0ea51ac497'
            '5f5a5f4cacd9ad39bd87f281d241da4e5d1ec96bce82328d80c42a92776a99e0'
            '01fde0bedf83bdc185065d7af524a61690efe576a67f922eaff3a1280c17b63a')

package() {
  _extdir="$pkgdir/usr/share/pi/extensions/hindsight"

  # dist/pi.js is a self-contained ESM bundle of the official adapter, and
  # exports a ready-made pi extension as its default export. The other 56 files
  # in the tarball are hooks for agents we do not run.
  install -d "$_extdir/skill"
  install -m644 "${srcdir}/package/dist/pi.js" "${_extdir}/pi.js"
  install -m644 "${srcdir}/package/skill/SKILL.md" "${_extdir}/skill/SKILL.md"
  install -m644 "${srcdir}/package.json" "${_extdir}/package.json"

  install -Dm644 "${srcdir}/coding-agent.json.example" \
    "${pkgdir}/usr/share/${pkgname}/coding-agent.json.example"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
