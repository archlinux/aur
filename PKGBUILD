# Maintainer: Michael Straube <michael_straube web de>
# Contributor: Rikard Falkeborn <rikard.falkeborn@gmail.com>
# Contributor: Hubert Maraszek <marach5 at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=xye
pkgver=0.12.2
pkgrel=3
pkgdesc="Puzzle game similar to sokoban or boulderdash"
url="http://xye.sourceforge.net/"
license=('ZLIB')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_ttf' 'xdg-utils')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "gcc6.patch")
sha1sums=('bdfc3d88fbc852fa728c9981f83c9dd048d159ae'
          'ad7a6186f5729beeb77d4b54df3e8b03038a9eb8')

prepare() {
  cd $pkgname-$pkgver

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' src/xsb_level.cpp

  # fix gcc6 build error https://sourceforge.net/p/xye/bugs/8/
  patch -p1 < "$srcdir/gcc6.patch"
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
