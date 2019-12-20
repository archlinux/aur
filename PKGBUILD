# Maintainer: Danil Yarantsev <tiberiumk12 at gmail dot com>
pkgname=doom2df-git
pkgver=r1174.5b8e9b8
pkgrel=1
pkgdesc="Doom2D Forever: A Doom2D remake with multiplayer"
arch=(x86_64 i386)
url="http://doom2d.org/"
license=('GPL3')
depends=(sdl2_mixer sdl2 enet)
makedepends=(git fpc)
source=(
  'git://repo.or.cz/d2df-sdl.git'
  'http://doom2d.org/doom2d_forever/latest/win32-d2df-latest.zip'
)
md5sums=(
  'SKIP'
  'SKIP'
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
  fpc -g -gl -dUSE_SDL2 -dUSE_OPENGL -dUSE_SDLMIXER -FE../../../ Doom2DF.lpr
}


package() {
  cd "${srcdir}"
  install -Dm755 Doom2DF "${pkgdir}"/usr/bin/Doom2DF

  mkdir -p "${pkgdir}"/usr/share/doom2df
  cp -r data maps wads "${pkgdir}"/usr/share/doom2df/
}
