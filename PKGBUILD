# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=signus
pkgver=1.96.1
pkgrel=3
pkgdesc="Signus: The Artefact Wars assic turn-based strategy war game similar to the old Battle Isle series."
arch=('x86_64' 'aarch64')
url="https://github.com/signus-game/signus"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'libvorbis' 'libjpeg-turbo')
source=(
  "https://github.com/signus-game/signus/archive/refs/tags/v"${pkgver}".tar.gz"
  "${pkgname}.desktop"
)
sha512sums=('d2a9146f6508f5ebee29a6d074c2b40ae767876daf5a92c86ebe990838d25f254159d9ea394a32e9a93ebccdf80dd683aa1145ba6fd4347c78f0236bd50d2bc7'
            '6a791044c16bd93f34e8fd77953f310ae645ee0daad5ec4f469247caf9b8665327c3b799b1ac63d8df357255ec85765f4e329c14266232a058f7445775622656')
conflicts=(${pkgname}-git)

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  #build signus
  cd "${srcdir}/${pkgname}-${pkgver}/signus"
  ./bootstrap
  ./configure --prefix=/usr/
  make
  make install DESTDIR=${srcdir}/${pkgname}-${pkgver}/build/
  #build signus-data
  cd "${srcdir}/${pkgname}-${pkgver}/signus-data"
  ./bootstrap
  ./configure --prefix=/usr/
  make
  make install DESTDIR=${srcdir}/${pkgname}-${pkgver}/build/
}

package() {
  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -rp ${srcdir}/${pkgname}-${pkgver}/build/* ${pkgdir}/
}
