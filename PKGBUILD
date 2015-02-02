# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-refcontrol
pkgver=0.8.17
pkgrel=1
pkgdesc='Control what gets sent as the HTTP Referer on a per-site basis.'
url=http://www.stardrifter.org/refcontrol/
arch=('any')
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
makedepends=('python')
source=("http://www.stardrifter.org/refcontrol/RefControl-$pkgver.xpi")
sha256sums=('8a5905723acbc92ea1fcb6e524892bf4a64a862bacf666c38baddec042d1531e')

package() {
  local GLOBIGNORE=*.xpi:license.txt
  local emid=$(python -c \
"import xml.etree.ElementTree as ET
tree = ET.parse('install.rdf')
root = tree.getroot()
print(root[0][0].text)")
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"$emid"

  install -d "$dstdir"
  cp -r * "$dstdir"
  install -D license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
