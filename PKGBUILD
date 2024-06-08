# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=doom_ascii
pkgname=${_pkgname}-git
pkgver=0.1.1.r7.052c252
pkgrel=1
pkgdesc="Text-based DOOM in your terminal! Source-port of doomgeneric. Does not have sound."
arch=('any')
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
makedepends=('git' 'make' 'gcc')
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}.sh")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
sha256sums=('SKIP'
            '27864d019900aa0728c95d77e70dfd94869e44a65e6657ef04110c5f5c1cc202')

pkgver() {
  cd "${_pkgsrc}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_pkgsrc}"
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dm644 "src/.default.cfg" "${pkgdir}/opt/${_pkgname}/.default.cfg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
