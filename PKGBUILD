# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=doom_ascii
_pkgname=doom-ascii
pkgver=0.1.1
pkgrel=1
pkgdesc="Text-based DOOM in your terminal! Source-port of doomgeneric. Does not have sound."
arch=('any')
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
makedepends=('make' 'gcc')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('34c4116d687cac91dc1e23bd580a6211ff490bcbbf85d6f00df0f4fe1fa886e6'
            '27864d019900aa0728c95d77e70dfd94869e44a65e6657ef04110c5f5c1cc202')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/^\s*I_EndRead\s*(\s*);\s*$/\/\/&/' src/w_wad.c
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm644 "src/.default.cfg" "${pkgdir}/opt/${pkgname}/.default.cfg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
