# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="metalang99"
pkgver=1.13.5
pkgrel=1
pkgdesc="Full-blown preprocessor metaprogramming"
arch=(
  'any'
)
url="https://metalang99.readthedocs.io"
_url="https://github.com/hirrolot/${pkgname}"
license=(
  'MIT'
)
checkdepends=(
  'cmake>=3.16'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('f3d1607d76b4b081d3295661c4c2b8d5fde4d5018b1aa409c84fb3a6660ffb90')

check() {
  cd "${srcdir}/${_pkgsrc}"
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership "include" -t "${pkgdir}/usr"

  install -vDm644 "ARCHITECTURE.md" "CHANGELOG.md" "README.md" "idioms.md" "optimization_tips.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
