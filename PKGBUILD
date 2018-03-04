# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=sdlada
pkgver=2.3.1
pkgrel=1
pkgdesc="An Ada binding to SDL"

arch=('i686' 'x86_64')
url="https://github.com/Lucretia/sdlada/"
license=('zlib')

depends=("gcc-ada" "sdl2")

source=(https://github.com/Lucretia/sdlada/archive/v$pkgver.tar.gz
        patch-makefile)
md5sums=('84ef633ff97b9dc6cb68b6230787cc0e'
         '6e9a0befc816ef87ed7d6dace43a5dd9')


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
