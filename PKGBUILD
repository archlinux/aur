# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="interface99"
pkgver=1.0.1
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
sha256sums=('ddc7cd979cf9c964a4313a5e6bdc87bd8df669142f29c8edb71d2f2f7822d9aa'
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
