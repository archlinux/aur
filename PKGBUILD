# Maintainer: Danil Yarantsev <tiberiumk12 at gmail dot com>
pkgname=doom2df-git
pkgver=r1174.5b8e9b8
pkgrel=1
pkgdesc="Doom2D Forever: A Doom2D remake with multiplayer"
arch=(x86_64 i386)
url="http://doom2d.org/"
license=('GPL3')
depends=(sdl2_mixer sdl2 enet libgl miniupnpc)
makedepends=(git fpc)
source=(
  'git://repo.or.cz/d2df-sdl.git'
  'http://doom2d.org/doom2d_forever/latest/win32-d2df-latest.zip'
  'doom2df.desktop'
  'doom2df.png'
)
md5sums=(
  'SKIP'
  'SKIP'
  '5c75c97fcc9826d0d83eac8f9cd4a9b7'
  '191cd29a6994ab257abf6c0b1060b2fd'
)
options=(
  !strip
)

pkgver() {
  cd "${srcdir}/d2df-sdl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/d2df-sdl/src/game"
  fpc -g -gl -dUSE_SDL2 -dUSE_OPENGL -dUSE_SDLMIXER -dUSE_MINIUPNPC -FE../../../ Doom2DF.lpr
}


package() {
  cd "${srcdir}"
  install -Dm755 Doom2DF "${pkgdir}"/usr/bin/Doom2DF
  install -Dm644 doom2df.desktop "${pkgdir}"/usr/share/applications/doom2df.desktop
  install -Dm644 doom2df.png "${pkgdir}"/usr/share/pixmaps/doom2df.png
  mkdir -p "${pkgdir}"/usr/share/doom2df
  cp -r data maps wads "${pkgdir}"/usr/share/doom2df/
}
