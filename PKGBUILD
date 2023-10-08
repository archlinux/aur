# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Leray <alexandre@stdin.fr>

pkgname=inkscape-axidraw-bin
pkgver=3.9.4
_zipname="AxiDraw_${pkgver//./}_LinX86"
pkgrel=1
pkgdesc='Inkscape extension for Axidraw'
provides=('inkscape-axidraw' 'inkscape-eggbot')
conflicts=('inkscape-axidraw' 'inkscape-eggbot')
url='https://wiki.evilmadscientist.com/Axidraw_Software_Installation#Linux'
depends=('python' 'inkscape')
license=('GPL2')
arch=('x86_64')
source=(
  "https://cdn.evilmadscientist.com/dl/ad/public/${pkgver//./}/${_zipname}.zip"
)
sha256sums=(
  '14e49a4cf0520d2a6da73c248c88cba8b1a5100581457e156e29e4d6b14a26fb'
)

package() {
  echo >&2 'Packaging the Inkscape extension'
  mkdir -p "${pkgdir}/usr/share/inkscape/extensions"
  cp -R --preserve=mode -T "${srcdir}/${_zipname}" \
    "${pkgdir}/usr/share/inkscape/extensions/axidraw"

  echo >&2 'Packaging the license of included SVG fonts'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_zipname}/svg_fonts/OFL.txt"
}
