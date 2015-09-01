# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=sdlada
pkgver=2.1.0
pkgrel=1
pkgdesc="An Ada binding to SDL"

arch=('i686' 'x86_64')
url="https://github.com/Lucretia/sdlada/"
license=('zlib')

depends=("gcc-ada" "sdl2")

source=(https://github.com/Lucretia/sdlada/archive/v2.1.0.tar.gz)
md5sums=('24d5f721af23dc085cb43938e04e3607')


build() 
{
  cd $srcdir/$pkgname-$pkgver

  make SDL_PLATFORM=linux SDL_BUILD=static SDL_MODE=release
}



package() 
{
  cd $srcdir/$pkgname-$pkgver

  SDL_PLATFORM=linux 
  SDL_BUILD=static 
  SDL_MODE=release


  gprinstall --prefix=$pkgdir/usr                  \
             --project-subdir=$pkgdir/usr/lib/gnat \
             --build-name=$SDL_MODE.$SDL_BUILD -p \
             -XSDL_BUILD=$SDL_BUILD -XSDL_MODE=$SDL_MODE -XSDL_PLATFORM=$SDL_PLATFORM \
             -Psdlada.gpr

  install --mode=0644 sdl_version.gpr $pkgdir/usr/lib/gnat
}
