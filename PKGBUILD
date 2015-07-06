# Maintainer: melchips <truphemus dot francois at gmail dot com>
pkgname=sdlconsole
pkgver=2.1
pkgrel=1
pkgdesc="A library for adding a drop down console to any SDL application"
arch=('i686' 'x86_64')
url="http://sdlconsole.sourceforge.net"
license=('LGPL')
depends=('sdl')
optdepends=('sdl_image')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/sdlconsole/$pkgname-$pkgver.tar.gz)
md5sums=('e2936117697a10a17f8e5a58653aed0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix for includes (headers were meant to be installed in /usr/include/SDL instead of /usr/include/SDL_console)
  sed -i 's/"SDL_events.h"/\<SDL\/SDL_events.h\>/g' include/SDL_console.h
  sed -i 's/"SDL_video.h"/\<SDL\/SDL_video.h\>/g' include/SDL_console.h
  sed -i 's/"begin_code.h"/\<SDL\/begin_code.h\>/g' include/SDL_console.h
  sed -i 's/"close_code.h"/\<SDL\/close_code.h\>/g' include/SDL_console.h

  make DESTDIR="$pkgdir/" install
}
