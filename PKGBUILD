# Maintainer: Rod Kay <rodakay5 at gnmail.com

pkgname=sdlada
pkgver=2.5.3
pkgrel=2
pkgdesc="An Ada binding to SDL"

arch=('i686' 'x86_64')
url="https://github.com/Lucretia/sdlada/"
license=('zlib')

depends=("gcc-ada" "sdl2_ttf" "sdl2_image")

source=(https://github.com/Lucretia/sdlada/archive/v$pkgver.tar.gz
        patch-sdl-video-pixel_formats.ads
        patch-sdl-video-palettes.ads)

md5sums=('8d0245cb6c03db3ed136c012d4cc9055'
         'db308de4a3297e497415b89e0aadbed4'
         '0ec6787e90fe1022270a78f3b5320e42')


prepare()
{
  cd $srcdir/$pkgname-$pkgver

  patch -Np0 -i ../patch-sdl-video-pixel_formats.ads  
  patch -Np0 -i ../patch-sdl-video-palettes.ads
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

  make  SDL_PLATFORM=linux  SDL_BUILD=static  SDL_MODE=release  DESTDIR=$pkgdir/usr  install
}
