# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="interface99"
pkgver=1.0.2
pkgrel=1
pkgdesc="Full-featured interfaces for C99"
arch=('any')
url="https://github.com/hirrolot/${pkgname}"
license=('MIT')
depends=('metalang99')
checkdepends=('cmake>=3.16')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_cmake_system_libs.patch")
sha256sums=('8bd007c48cf05436ced60884e8e3a05ede46105f3efae9bf29e0f4d30f938f9e'
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
