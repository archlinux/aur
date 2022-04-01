# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.com>
# Contributor: gyo <nucleogeek@gmail.com>

pkgname=sdl_pango
pkgver=0.1.2
pkgrel=8
pkgdesc="Pango SDL binding"
arch=('x86_64')
url="http://sdlpango.sourceforge.net/"
license=('LGPL')
depends=('pango' 'sdl')
source=(https://downloads.sourceforge.net/sourceforge/sdlpango/SDL_Pango-$pkgver.tar.gz
        SDL_Pango-$pkgver-API-adds.patch
        matrix_declarations.patch)
sha256sums=('7f75d3b97acf707c696ea126424906204ebfa07660162de925173cdd0257eba4'
            '5a989c7acb539fce640323d3995cca8913a4b8869f5c690b78501ec6b5c86d5d'
            'cfff600cae86bf75070f8921da565210409efba318f45361b34489ac29298bc5')

prepare() {
  cd SDL_Pango-$pkgver
  patch -Np0 -i ../SDL_Pango-$pkgver-API-adds.patch
  patch -Np1 -i ../matrix_declarations.patch
}

build() {
  cd SDL_Pango-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd SDL_Pango-$pkgver
  make DESTDIR="$pkgdir" install
}
