# Maintainer: gamestime102 < >
pkgname=dark-dream
pkgver=1
pkgrel=1
pkgdesc="SDL2 and OpenGL for wirite FPS games: Dark-Dream"
arch=('x86_64')
url="https://gitlab.com/gamestime102/Dark-Dream/Dark-Dream"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'glu' 'libgl')
makedepends=('git' 'gcc')
provides=("dark-dream")
conflicts=("dark-dream")
source=("git+https://gitlab.com/gamestime102/Dark-Dream/Dark-Dream.git")
sha256sums=('SKIP')

pkgver() {
  cd "Dark-Dream"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "Dark-Dream"
  gcc -O3 dark_dream.c -o dark-dream \
      -lSDL2 -lSDL2_mixer -lGL -lGLU -lm \
      -DUSE_SDL_MIXER
}

package() {
  cd "Dark-Dream"
  install -Dm755 dark-dream "${pkgdir}/usr/bin/dark-dream"
  
  # Song - Beta
  #install -d "${pkgdir}/usr/share/dark-dream"
  #cp *.wav "${pkgdir}/usr/share/dark-dream/" 2>/dev/null || true
}
