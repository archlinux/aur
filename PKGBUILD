# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=inkscape-openpaths-git
pkgver=r8.10d0d7c
pkgrel=2
pkgdesc='Inkscape extension for opening up closed paths, e. g. for single-line fonts in OPF/OTF/TTF format'
arch=('any')
url='https://gitlab.com/EllenWasbo/inkscape-extension-openpaths'

# No license file present but the author has granted the GPL2 license here:
# https://inkscape.org/~EllenWasbo/%E2%98%85openclosedpath
license=('GPL-2.0-only')

depends=('inkscape' 'python')
makedepends=('git')
options=('!debug' '!strip')

source=(
  "${pkgname}::git+https://gitlab.com/EllenWasbo/inkscape-extension-openpaths.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

package() {
  echo >&2 'Packaging the Inkscape extension'
  install -D -m 644 -t "${pkgdir}/usr/share/inkscape/extensions" \
    "${srcdir}/${pkgname}/openClosedPath"{.inx,.py}

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}/README.md"
}
