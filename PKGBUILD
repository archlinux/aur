# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sdl-ball
pkgver=1.03
pkgrel=1
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
source=("http://sourceforge.net/projects/${pkgname}/files/SDL-Ball_1.03_build-6_src.tar.xz")
sha256sums=('6910a7166d16e3bfe4a67b538d02e25eec0d06276aef399b9143fd246cd76442')

build() {
  cd "${srcdir}/SDL-Ball_source_build_0006_src"
  
  # uncomment following 2 lines for wiimote support.
  #export LIBS="-lwiiuse"
  #export CFLAGS="${CXXFLAGS} -DWITH_WIIUSE"

  make DATADIR="/usr/share/games/${pkgname}/themes/"
}

package() {
  cd "${srcdir}/SDL-Ball_source_build_0006_src"

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

