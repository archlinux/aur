# Maintainer: envolution
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="doom_ascii"
pkgver=0.2.0
pkgrel=1
pkgdesc="Text-based DOOM in your terminal! Source-port of doomgeneric. Does not have sound."
arch=('any')
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
depends=('glibc' 'sh')
install=doom_ascii.install
_pkgsrc="doom-ascii-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('fb4790d968559dc208290a689378381bfb121406873eadc53e912047b805a61f'
            '7e4817fcb8bcd5038f648e0f8291ca073a3f111fba6e133984b906cc26dfafc1')
backup=("usr/lib/${pkgname}/.default.cfg")

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  install -Dm755 "${pkgname}.sh"        "${pkgdir}/usr/bin/${pkgname}"
  cd "${_pkgsrc}"
  install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/usr/share/bin/${pkgname}.bin"
  install -Dm666 "src/.default.cfg"      "${pkgdir}/usr/lib/${pkgname}/.default.cfg"
  ln -s          .default.cfg            "${pkgdir}/usr/lib/${pkgname}/default.cfg"
  install -dm777                         "${pkgdir}/usr/lib/${pkgname}/.savegame"
  install -Dm644 "README.md"             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
