# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sdl-ball
pkgver=1.02
pkgrel=3
pkgdesc="A Breakout clone with pretty graphics"
arch=('i686' 'x86_64')
url="http://sdl-ball.sourceforge.net/"
license=('GPL3')
# uncomment following line for wiimote support. Unable to get libbtctl to build at this time.
#depends=('glu' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'wiiuse' 'libbtctl')
# comment line below if compiling for wiimote support.
depends=('glu' 'sdl_mixer' 'sdl_ttf' 'sdl_image')
# uncomment line below if building the gimp-leveleditor
#makedepends=('gimp')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('03ae91c0ddbcf055a224b765da55dc5c8417e9b09971eb56280c8e602ba01423')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # uncomment following 2 lines for wiimote support.
  #export LIBS="-lwiiuse"
  #export CFLAGS="${CXXFLAGS} -DWITH_WIIUSE"

  make DATADIR="/usr/share/games/${pkgname}/themes/"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/games/${pkgname}"
  cp -r README themes "${pkgdir}/usr/share/games/${pkgname}/"
  install -Dm755 sdl-ball "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 themes/default/icon32.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 leveleditor/index.html "${pkgdir}/usr/share/games/${pkgname}/leveleditor/index.html"
  cp -r leveleditor/gfx "${pkgdir}/usr/share/games/${pkgname}/leveleditor/gfx"

  # uncomment following lines to build and install the gimp-leveleditor
  #cd "${srcdir}/${pkgname}-${pkgver}/leveleditor/gimp-leveleditor"
  #gimptool-2.0 --build gimp-sdlball.c
  #install -Dm755 gimp-sdlball "${pkgdir}/usr/lib/gimp/2.0/plug-ins/gimp-sdlball"
  #install -Dm644 readme "${pkgdir}/usr/share/games/${pkgname}/leveleditor/gimp-leveleditor/readme"
  #install -Dm644 sdlball.xcf "${pkgdir}/usr/share/games/${pkgname}/leveleditor/gimp-leveleditor/sdlball.xcf" 
}
