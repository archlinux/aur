# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=alsa-patch-bay
pkgver=1.0.0
pkgrel=1
pkgdesc="A graphical patch bay for the ALSA sequencer API and the JACK audio API"
arch=('i686') #x86_64 not working
url="http://pkl.net/~node/software/alsa-patch-bay/"
license=('GPL')
depends=('fltk' 'jack')
install="alsa-patch-bay.install"
source=(http://pkl.net/~node/software/$pkgname/$pkgname-$pkgver.tar.gz $pkgname.patch)
md5sums=('3aa458f6bee8b83b2cf7330707d72430'
         'f2b643febf922c93777452e6d809af00')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../../alsa-patch-bay.patch
  ./configure --prefix=/usr
  sed -i '946d' src/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
