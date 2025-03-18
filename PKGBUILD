# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="datatype99"
pkgver=1.6.5
pkgrel=1
pkgdesc="Algebraic data types for C99"
arch=('any')
url="https://github.com/hirrolot/${pkgname}"
license=('MIT')
depends=('metalang99')
checkdepends=('cmake>=3.16')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_cmake_system_libs.patch")
sha256sums=('f38c077afdb91b7d754321be5d3c4a43ed5420c1ad51514d1de20023960f9a8e'
            'a19bf501291061ed836231340a28106c922952a7cdde9d55c6d8438bf03dc196')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_cmake_system_libs.patch"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
