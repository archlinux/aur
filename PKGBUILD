# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=adonthell
pkgver=0.3.5
pkgrel=7
pkgdesc="A 2D graphical, single player role playing game engine"
arch=('i686' 'x86_64')
url="http://adonthell.nongnu.org/"
license=('GPL')
depends=('sdl_mixer' 'sdl_ttf' 'python2')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-src-$pkgver.tar.gz
        configure.diff)
md5sums=('64a344b1ed8a7808d7adafa337120a00'
         '73bba2c5e67c8f4badeb2d2b0bdf4d8b')

prepare() {
  cd $pkgname-$pkgver

  patch -Np0 -i ../configure.diff
# NEW NEW NEW ;-) Set default screen-mode to fullscreen!!
  sed 's|screen_mode = 0|screen_mode = 1|g' -i src/prefs.cc

  sed '/^ *for ac_prog in / s|python|python2|' -i configure
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
