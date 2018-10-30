# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: AlexanderR <alexander r at gmx com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=fizmo
pkgver=0.8.5
pkgrel=1
pkgdesc="A Z-Machine interpreter supporting unicode, sound, blorbfile and more."
arch=('i686' 'x86_64')
url=" https://fizmo.spellbreaker.org/"
license=('BSD')
depends=('ncurses' 'freetype2' 'libxml2' 'libsndfile' 'libjpeg-turbo' 'libpng' 'sdl2')
groups=('inform')
source=("https://fizmo.spellbreaker.org/source/$pkgname-$pkgver.tar.gz")
sha256sums=('1c259a29b21c9f401c12fc24d555aca4f4ff171873be56fb44c0c9402c61beaa')

build() {
  cd $pkgname-$pkgver

  ./configure \
      --prefix=/usr \
      --disable-x11
  make

  cd doc
  ./create-txts.sh
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

