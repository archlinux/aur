# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Boris Timofeev <mashin87@gmail.com>
pkgname=xroar
pkgver=0.34.3
pkgrel=1
pkgdesc="A Dragon and Tandy CoCo emulator."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.6809.org.uk/dragon/xroar.shtml"
depends=('gtk2' 'sdl2' 'libgl' 'libsndfile' 'gtkglext')
makedepends=()
install=xroar.install
source=(http://www.6809.org.uk/xroar/dl/$pkgname-$pkgver.tar.gz
        xroar.desktop
        xroar.png)
sha1sums=('b2f5cde204b6fe9904bb014d8f5cc8734d181765'
          'dd02919bbe5c1fd4f6291fc734de15900c33ec7d'
          '39af4e1493f50cea1937da7a77cfed3751a00308')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-jack
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 ./src/xroar $pkgdir/usr/bin/xroar
  install -D -m 644 ../xroar.png $pkgdir/usr/share/pixmaps/xroar.png
  install -D -m 644 ../xroar.desktop $pkgdir/usr/share/applications/xroar.desktop
  mkdir -p $pkgdir/usr/share/xroar/roms
  gzip ./doc/xroar.info
  install -D -m 644 ./doc/xroar.info.gz $pkgdir/usr/share/info/xroar.info.gz
}

