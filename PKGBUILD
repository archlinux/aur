# Maintainer: Sebastien MacDougall-Landry

pkgname=sdl2_fontcache
pkgver=1
pkgrel=1
pkgdesc='A generic font caching library'
url='https://github.com/grimfang4/SDL_FontCache'
source=("git+https://github.com/grimfang4/SDL_FontCache.git")
arch=('x86_64')
license=('MIT')
depends=('sdl2_ttf')
sha256sums=('SKIP')

build () {
  cd SDL_FontCache
  sed -i 's|"SDL.h"|<SDL2/SDL.h>|g' SDL_FontCache.h
  sed -i 's|"SDL_ttf.h"|<SDL2/SDL_ttf.h>|g' SDL_FontCache.h
  gcc -O3 -fPIC -shared SDL_FontCache.c -l SDL2 -l SDL2_ttf -o libSDL2_FontCache.so
}

package () {
  cd SDL_FontCache
  install -Dm755 libSDL2_FontCache.so -t "$pkgdir/usr/lib"
  install -Dm644 SDL_FontCache.h -t "$pkgdir/usr/include/SDL2"
}
