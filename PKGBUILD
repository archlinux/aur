# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Peter Johansson <zeronightfall at gmail dot com>

pkgname=starfighter
pkgver=1.4
pkgrel=1
pkgdesc="Side-scrolling shoot 'em up space game"
arch=('i686' 'x86_64')
url="http://starfighter.nongnu.org"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.gz
        $pkgname.desktop)
md5sums=('171c4eb507f33a0202ca8fed291280d8'
         'edb308677fe38a6defe76aba97212b2a')

build() {
  cd $pkgname-$pkgver-src
  make BINDIR=/usr/bin/ DATADIR=/usr/share/parallelrealities/
}

package() {
  cd $pkgname-$pkgver-src
  make BINDIR=/usr/bin/ DATADIR=/usr/share/parallelrealities/ DESTDIR=$pkgdir install
  
  mkdir $pkgdir/usr/share/pixmaps
  ln -s ../parallelrealities/gfx/icon2.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  #quick fix for icons with wrong permissions
  chmod 644 $pkgdir/usr/share/parallelrealities/gfx/ore{1,3}.png
}
