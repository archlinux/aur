# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="metalang99"
pkgname="${_pkgname}-git"
pkgver=1.13.3.r14.gbbd4749
pkgrel=1
pkgdesc="Full-blown preprocessor metaprogramming"
arch=('any')
url="https://metalang99.readthedocs.io"
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
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "include" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "ARCHITECTURE.md" "${pkgdir}/usr/share/doc/${_pkgname}/ARCHITECTURE.md"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "idioms.md" "${pkgdir}/usr/share/doc/${_pkgname}/idioms.md"
  install -vDm644 "optimization_tips.md" "${pkgdir}/usr/share/doc/${_pkgname}/optimization_tips.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
