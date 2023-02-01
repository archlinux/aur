# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: https://bbs.archlinux.org/viewtopic.php?pid=1625279
# Contributor: hotspur (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=mirrormagic
pkgver=3.1.0
pkgrel=1
pkgdesc="Arcade style game like Deflektor (C64) or Mindbender (Amiga)."
arch=('i686' 'x86_64')
url="http://www.artsoft.org/mirrormagic/"
license=('GPL2')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_net' 'smpeg')

source=("https://www.artsoft.org/RELEASES/linux/mirrormagic/mirrormagic-${pkgver}-linux.tar.gz"
        "mirrormagic.desktop" "mirrormagic.sh")

md5sums=('406ddba5be346563a2265f211caf64ea'
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

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
