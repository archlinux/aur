# Maintainer:
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
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "xye-gcc6.patch")
sha256sums=('5d7c04f37d6b4a1821594512c7ddbc8189f968e08ecfd5af55231302f2f917d8'
            '7b674fbfc81d7105fe667a267217f89cbe50012e06065626d778e4d4563de54f')

prepare() {
  cd $pkgname-$pkgver

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' src/xsb_level.cpp

  # https://sourceforge.net/p/xye/bugs/8/
  patch -p1 -i ../xye-gcc6.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
