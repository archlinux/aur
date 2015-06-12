# Contributor: Nick Bolten <Shirakawasuna at gmail _dot_ com>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=amoebax
pkgver=0.2.1
pkgrel=1
pkgdesc="A cute and addictive action-puzzle game"
arch=('i686' 'x86_64')
url="http://www.emma-soft.com/games/amoebax/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'libpng' 'libogg' 'libvorbis' 'gcc-libs') 
source=(http://www.emma-soft.com/games/amoebax/download/${pkgname}-${pkgver}.tar.bz2 binreloc-cpp-fix.patch)
md5sums=('16835cf051334bd3d75345d879b23cdf'
         '29a30fcc18689733022676a383ff3589')

build() { 
  cd $srcdir/$pkgname-$pkgver 
  patch -p1 < $srcdir/binreloc-cpp-fix.patch
  ./configure --prefix=/usr
  make
  sed -i s,LogicGame,ArcadeGame,g $srcdir/$pkgname-$pkgver/data/$pkgname.desktop
}

package() {
  cd $srcdir/$pkgname-$pkgver 
  make DESTDIR=$pkgdir install
}
