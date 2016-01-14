# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Peter Johansson <zeronightfall at gmail dot com>

pkgname=starfighter
pkgver=1.5.1
pkgrel=1
pkgdesc="Side-scrolling shoot 'em up space game"
arch=('i686' 'x86_64')
url="http://starfighter.nongnu.org"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
source=(http://download.savannah.gnu.org/releases/$pkgname/${pkgver:0:3}/$pkgname-$pkgver-src.tar.gz
        makefile.patch)
md5sums=('4035e1521c726d11f877b5b9e02e9377'
         'f340a40588aaccd629e55e45a3c54bbb')

prepare() {
  cd $pkgname-$pkgver-src
  patch -p0 < "$srcdir/makefile.patch"
}

build() {
  cd $pkgname-$pkgver-src
  make DATADIR=/usr/share/starfighter/
}

package() {
  cd $pkgname-$pkgver-src
  make BINDIR=/usr/bin/ DATADIR=/usr/share/starfighter/ DESTDIR=$pkgdir install
}
