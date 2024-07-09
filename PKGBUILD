# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="localdimfinder"
_pkgName="localDimFinder"
pkgname="${_pkgname}-bin"
pkgver=1.0
pkgrel=1
pkgdesc="A Bertini module for computing local dimensions of algebraic sets"
arch=('x86_64' 'i686')
url="https://bertini.nd.edu/${_pkgName}/index.html"
license=('custom:Bertini license')
depends=('bertini')
provides=("${_pkgname}" "${_pkgName}")
conflicts=("${_pkgname}" "${_pkgName}")
source=("https://bertini.nd.edu/Bertini_License")
source_x86_64=("https://bertini.nd.edu/LocalDimFinder/LocalDimFinderLinux64_v${pkgver}.tar.gz")
source_i686=("https://bertini.nd.edu/LocalDimFinder/LocalDimFinderLinux32_v${pkgver}.tar.gz")
sha256sums=('e53c1b505126e6f4ab9ddaedd5b807303b693b8d4997f13a502bc902569ab1f1')
sha256sums_x86_64=('0115dbc1d65d93d16aa140c903d3970dbb6892157451a8ad47bd0610e72ce5c9')
sha256sums_i686=('a441985e59568da91c532eaf06f3cb93e3fccb872cbd2d7910c87825fd38bfa5')

case "${CARCH}" in
  x86_64)
    _bit="64"
    ;;
  i686)
    _bit="32"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -Dm644 "Bertini_License" "${pkgdir}/usr/share/licenses/${_pkgName}/Bertini_License"
  # install -Dm644 "GMP_MPFR_License" "${pkgdir}/usr/share/licenses/${_pkgName}/GMP_MPFR_License"

  cd "LocalDimFinderLinux${_bit}_v${pkgver}"
  install -Dm755 "${_pkgName}" "${pkgdir}/usr/bin/${_pkgName}"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${_pkgName}/README"
  install -Dm644 "LocalDimFinder.pdf" "${pkgdir}/usr/share/doc/${_pkgName}/LocalDimFinder.pdf"
}
