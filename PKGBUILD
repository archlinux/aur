# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_fontname=spleen

pkgname=spleen-font
pkgver=1.9.3
pkgrel=2
pkgdesc="Monospaced bitmap fonts for user interface including console (OTB, OTF, PSFU)"
arch=('any')
license=('BSD')
url="https://www.cambus.net/spleen-monospaced-bitmap-fonts/"
conflicts=('bdf-spleen')
source=(
  "https://github.com/fcambus/spleen/releases/download/${pkgver}/spleen-${pkgver}.tar.gz"
)
sha256sums=('b7ad1edb02a5ddad117ca94f026eb8450b51504d2e81bc3a03875e12d4e76b25')

package() {
  cd "${srcdir}/${_fontname}-${pkgver}"

  # Install font to its own dir.
  # (c.f.: https://archlinux.org/todo/fix-ttf-font-default-font-setup/)
  install -dm755 "${pkgdir}/usr/share/fonts/${_fontname}"
  for font_file in spleen-*.otb; do install -Dm644 "${font_file}" \
    "${pkgdir}/usr/share/fonts/${_fontname}/${font_file}"; done
  for font_file in spleen-*.otf; do install -Dm644 "${font_file}" \
    "${pkgdir}/usr/share/fonts/${_fontname}/${font_file}"; done
  for font_file in spleen-*.psfu; do install -Dm644 "${font_file}" \
    "${pkgdir}/usr/share/kbd/consolefonts/${font_file}"; done
  install -Dm644 fonts.alias "${pkgdir}/usr/share/fonts/${_fontname}/fonts.alias"

  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
