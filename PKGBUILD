# Maintainer:  Eric DeStefano <eric at ericdestefano dot com> 
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Boris Timofeev <mashin87@gmail.com>
pkgname=xroar
pkgver=0.35
pkgrel=1
pkgdesc="A Dragon and Tandy CoCo emulator."
arch=('x86_64')
license=('GPL')
url="http://www.6809.org.uk/dragon/xroar.shtml"
depends=('gtk2' 'sdl2' 'libgl' 'libsndfile' 'gtkglext')
makedepends=()
install=xroar.install
source=(http://www.6809.org.uk/xroar/dl/$pkgname-$pkgver.tar.gz
        xroar.desktop
        xroar.png)
sha256sums=('9fd751cbcf52689e53623c4a58add5a27be22356bc3e61bdb9ca4a474513432d'
            '50eb3ca94bbc9972283998818b8dab2bcdb1dcc369f39aa97439b5b8ba0aa8dc'
            '1468756d038a050640764ee9a86e98ff04e1072f1a9b8da9be87039a02367eb1')

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
