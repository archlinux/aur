# Maintainer: SanskritFritz (gmail)

pkgname=rnd_jue_ii
pkgver=1.0.0
pkgrel=1
pkgdesc="A remake of the game Rocks'n'Diamonds."
arch=('x86_64')
url="http://www.jb-line.de/rnd17/17start_e.html"
license=('GPL2')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_net' 'smpeg')

source=("http://www.jb-line.de/rnd17/dat/rndjue_II-$pkgver.tar.gz"
        "rnd_jue_ii.desktop" "rnd_jue_ii.sh")

md5sums=('b491e177a8e60273ba39a3bfa2d6ec3b'
         'd482985e35cedf1ac489b26e83c66441'
         '080002ed407306f26c96ef5ade6ba9c2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#   make RO_GAME_DIR="/usr/share/${pkgname}" RW_GAME_DIR=~/.${pkgname}
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r rocksndiamonds rnd_jue_ii graphics levels music sounds docs conf "${pkgdir}/usr/share/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 ChangeLog CREDITS INSTALL COPYING "${pkgdir}/usr/share/doc/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}

# vim:set ts=2 sw=2 et:
