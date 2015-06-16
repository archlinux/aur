# Based on katawa-shoujo PKGBUILD written by Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=katawa-shoujo-nolib
_pkgname=katawa-shoujo
pkgver=1.3
pkgrel=1
pkgdesc="Ren'Py game Katawa Shoujo (only data file, need renpy installed)"
arch=('any')
url='http://katawa-shoujo.com/'
license=('CCPL:BY-NC-ND')
depends=('renpy')
provides=('katawa-shoujo')
conflicts=('katawa-shoujo')
install="${_pkgname}.install"
source=("[4ls]_katawa_shoujo_${pkgver}-[linux-x86][FCF758CC].tar.bz2::http://dl.katawa-shoujo.com/gold_${pkgver}/%5b4ls%5d_katawa_shoujo_${pkgver}-%5blinux-x86%5d%5bFCF758CC%5d.tar.bz2"
        "${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.png")

md5sums=('b666b2c164c38933114d6318f8d20d69'
         '88bb1f3a99762f8ea1e4fd3b7effec23'
         '52da5f2a8365a9b88d65fad1301e439b'
         '6d70e339e33d7c13a8ab03a5d3498c4f')

package() {
  # copy main files
  cd "${srcdir}/Katawa Shoujo-${pkgver}-linux/"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  #cp -r common game lib renpy "${pkgdir}/opt/${_pkgname}"
  cp -r game "${pkgdir}/usr/share/${_pkgname}"

  # copy game manual
  install -D -m644 'Game Manual.pdf' "${pkgdir}/usr/share/doc/${_pkgname}/gamemanual.pdf"

  # copy license
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # copy bash script
  install -D -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

# vim:set ts=2 sw=2 et:
