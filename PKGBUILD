# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=sdlada
pkgver=2.1.7
pkgrel=1
pkgdesc="An Ada binding to SDL"

arch=('i686' 'x86_64')
url="https://github.com/Lucretia/sdlada/"
license=('zlib')

depends=("gcc-ada" "sdl2")

source=(https://github.com/Lucretia/sdlada/archive/v2.1.7.tar.gz
        patch-makefile)
md5sums=('255a57dc59d250af12dbe3cb7be76e58'
         '43906f6de67f33578375fe83468073e1')


prepare()
{
  cd $srcdir/$pkgname-$pkgver

  patch -p0 -i ../patch-makefile
}



build()
{
  cd $srcdir/$pkgname-$pkgver
  cd build/gnat

  make -j1 SDL_PLATFORM=linux SDL_BUILD=static SDL_MODE=release 
}



package() 
{
  cd $srcdir/$pkgname-$pkgver
  cd build/gnat

  make  SDL_PLATFORM=linux  SDL_BUILD=static  SDL_MODE=release  DESTDIR=$pkgdir  install
}
