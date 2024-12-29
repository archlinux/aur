# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slice99"
pkgname="${_pkgname}-git"
pkgver=0.7.7.r10.g63404eb
pkgrel=1
pkgdesc="Memory slices for C99"
arch=('any')
url="https://hirrolot.github.io/slice99"
_url="https://github.com/hirrolot/${_pkgname}"
license=('MIT')
makedepends=('git')
checkdepends=('cmake>=3.16')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  chmod +x ./scripts/test.sh
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${_pkgname}.h" "${pkgdir}/usr/include/${_pkgname}.h"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
