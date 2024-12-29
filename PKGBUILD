# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="interface99"
pkgname="${_pkgname}-git"
pkgver=1.0.1.r7.g1fecd8e
pkgrel=1
pkgdesc="Full-featured interfaces for C99"
arch=('any')
url="https://github.com/hirrolot/${_pkgname}"
license=('MIT')
depends=('metalang99')
makedepends=('git')
checkdepends=('cmake>=3.16')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_cmake_system_libs.patch")
sha256sums=('SKIP'
            'ea01860c953b32ebd58cc92d6007a7f647a08f9899e3a55d8ad085c8f51932c6')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_pkgname}_cmake_system_libs.patch"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${_pkgname}.h" "${pkgdir}/usr/include/${_pkgname}.h"
  install -vDm644 "CHANGELOG.md"  "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
