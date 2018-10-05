# Based on original katawa-shoujo PKGBUILD (but use native renpy instead of bundled one) written by Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=katawa-shoujo
pkgver=1.3.1
pkgrel=2
pkgdesc="a bishoujo-style visual novel by Four Leaf Studios built on renpy"
arch=('any')
url='http://katawa-shoujo.com/'
license=('CCPL:BY-NC-ND')
depends=('renpy6')
install="${pkgname}.install"
source=("[4ls]_katawa_shoujo_${pkgver}-[linux-x86][18161880].tar.bz2::http://dl.katawa-shoujo.com/gold_${pkgver}/%5b4ls%5d_katawa_shoujo_${pkgver}-%5blinux-x86%5d%5b18161880%5d.tar.bz2"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png")

md5sums=('8511b385c755e810893d05e5264b363d'
         '2747251eaa282a464d7ad7b80dc286b4'
         '52da5f2a8365a9b88d65fad1301e439b'
         '6d70e339e33d7c13a8ab03a5d3498c4f')

package() {
  # copy main files
  cd "${srcdir}/Katawa Shoujo-${pkgver}-linux/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r game "${pkgdir}/usr/share/${pkgname}"

  # copy game manual
  install -D -m644 'Game Manual.pdf' "${pkgdir}/usr/share/doc/${pkgname}/gamemanual.pdf"

  # copy license
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # copy bash script
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
