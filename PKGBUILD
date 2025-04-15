# Maintainer: Pierre Ayoub <pierreay@proton.com>
# Contributor: Ulf Winberg <ulfwin@gmail.com>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
_pkgname="inkscape-open-symbols"
pkgname="${_pkgname}-git"
pkgver=1.2.1.r64.g48fc83b
pkgrel=1
pkgdesc="Open source icon sets to use as Inkscape symbols"
arch=('any')
url="https://github.com/PanderMusubi/inkscape-open-symbols"
license=('MIT')
depends=('inkscape')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/PanderMusubi/inkscape-open-symbols.git"
        'https://raw.githubusercontent.com/PanderMusubi/inkscape-open-symbols/master/LICENSE.txt')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/share/inkscape/symbols"
  find . -mindepth 2 -iname '*.svg' \
         -exec 'cp' '{}' "${pkgdir}/usr/share/inkscape/symbols" ';'

  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
