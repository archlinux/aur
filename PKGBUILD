# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: https://bbs.archlinux.org/viewtopic.php?pid=1625279
# Maintainer: SanskritFritz (gmail)

pkgname=mirrormagic
pkgver=3.0.0
pkgrel=1
pkgdesc="Arcade style game like Deflektor (C64) or Mindbender (Amiga)."
arch=('i686' 'x86_64')
url="http://www.artsoft.org/mirrormagic/"
license=('GPL2')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_net' 'smpeg')

source=("http://www.artsoft.org/RELEASES/unix/mirrormagic/${pkgname}-${pkgver}.tar.gz"
        "mirrormagic.desktop" "mirrormagic.sh")

md5sums=('2670a44a98c4095a8360995ada533c64'
         '62a7183f61086072e05893e11d5ea898'
         'e6c52ffc78c5e591cb643e9c575f550e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make RO_GAME_DIR="/usr/share/${pkgname}" RW_GAME_DIR=~/.${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r rocksndiamonds mirrormagic graphics levels music sounds docs conf "${pkgdir}/usr/share/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 ChangeLog CREDITS INSTALL COPYING "${pkgdir}/usr/share/doc/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}

# vim:set ts=2 sw=2 et:
