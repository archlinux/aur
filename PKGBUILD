# Contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>
pkgname=enigma_sdl
pkgver=1.21
pkgrel=1
pkgdesc="Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga."
url="http://www.nongnu.org/enigma/"
depends=('libpng' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'xdg-utils' 'curl')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/enigma-game/enigma-$pkgver.tar.gz)
sha256sums=('d872cf067d8eb560d3bb1cb17245814bc56ac3953ae1f12e2229c8eb6f82ce01')
license=('GPL')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/enigma-$pkgver
  ./configure --prefix=/usr --program-suffix=_sdl --sysconfdir=/etc --disable-sdltest --enable-optimize
  make
}

package(){
  cd $srcdir/enigma-$pkgver
  make DESTDIR=$pkgdir install
  # removing enet files to avoid file conflicts
  rm -R $pkgdir/usr/include/
  rm -R $pkgdir/usr/lib/
  sed -i s/Exec=enigma/Exec=enigma_sdl/ $pkgdir/usr/share/applications/enigma.desktop
}
