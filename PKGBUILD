# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=adonthell
pkgver=0.3.5
pkgrel=6
pkgdesc="A 2D graphical, single player role playing game engine"
arch=('i686' 'x86_64')
url="http://adonthell.linuxgames.com/"
license=('GPL')
depends=('sdl_mixer>=1.2' 'sdl_ttf>=2' 'python>=2')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-src-$pkgver.tar.gz \
	configure.diff)
md5sums=('64a344b1ed8a7808d7adafa337120a00'
         '196c9fd4240b3c2633dce3c864aa70fe')

build() {
  cd $pkgname-$pkgver

  patch -Np0 -i ../configure.diff || return 1

  # NEW NEW NEW ;-) Set default screen-mode to fullscreen!!
  sed 's|screen_mode = 0|screen_mode = 1|g' -i src/prefs.cc

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
