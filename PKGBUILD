# Maintainer: Ulf Winberg <ulfwin@gmail.com>
_pkgname="inkscape-open-symbols"
pkgname="${_pkgname}-git"
pkgver=v1.2.1.r12.g7a991f1
pkgrel=1
pkgdesc="Open source icon sets to use as Inkscape symbols"
arch=('any')
url="https://github.com/Xaviju/inkscape-open-symbols"
license=('MIT')
depends=('inkscape')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/Xaviju/inkscape-open-symbols.git"
        'https://raw.githubusercontent.com/Xaviju/inkscape-open-symbols/master/LICENSE.txt')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/share/inkscape/symbols"
  find . -mindepth 2 -iname '*.svg' \
         -exec 'cp' '{}' "${pkgdir}/usr/share/inkscape/symbols" ';'

  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
