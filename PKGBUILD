# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: AlexanderR <alexander r at gmx com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=fizmo
pkgver=0.8.2
pkgrel=1
pkgdesc="A Z-Machine interpreter supporting unicode, sound, blorbfile and more."
arch=('i686' 'x86_64')
url=" https://fizmo.spellbreaker.org/"
license=('BSD')
depends=('ncurses' 'freetype2' 'libxml2' 'libsndfile' 'libjpeg-turbo' 'libpng' 'sdl2')
groups=('inform')
source=("https://fizmo.spellbreaker.org/source/$pkgname-$pkgver.tar.gz")
sha256sums=('369c3b58e019756229bf7e72cc5b15c049f1d6d5c65d7653267e67cef109e675')

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
  install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

