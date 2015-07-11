# Contributor: Boris Timofeev <mashin87@gmail.com>
pkgname=xroar
pkgver=0.33.2
pkgrel=1
pkgdesc="A Dragon and Tandy CoCo emulator."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.6809.org.uk/dragon/xroar.shtml"
depends=('gtk2' 'sdl' 'libgl' 'libsndfile')
makedepends=()
install=xroar.install
source=(http://www.6809.org.uk/xroar/dl/$pkgname-$pkgver.tar.gz
        xroar.desktop
        xroar.png)
md5sums=('d17eb0c201d0c8572fb4f89605ea0f79'
         'b72be2c92759966c932b6e61c1ae4fef'
         '8d34759e88a1ddc929a5db982db06e6a')

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

