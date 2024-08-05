# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="doom_ascii"
pkgver=0.1.1
pkgrel=2
pkgdesc="Text-based DOOM in your terminal! Source-port of doomgeneric. Does not have sound."
arch=('any')
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
depends=('glibc' 'sh')
_pkgsrc="doom-ascii-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}_fix_w_wad_c.patch")
sha256sums=('34c4116d687cac91dc1e23bd580a6211ff490bcbbf85d6f00df0f4fe1fa886e6'
            '27864d019900aa0728c95d77e70dfd94869e44a65e6657ef04110c5f5c1cc202'
            'c1bb903467e5c012662e77ff4b9347c7fb6c966a1798e2af5400d0318b5a78e4')
backup=("opt/${pkgname}/.default.cfg")

prepare() {
  cd "${srcdir}/${_pkgsrc}/src"
  patch -p1 -i "${srcdir}/${pkgname}_fix_w_wad_c.patch"
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
  install -Dm644 "src/.default.cfg"      "${pkgdir}/opt/${pkgname}/.default.cfg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
