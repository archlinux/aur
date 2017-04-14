# $Id$
# Maintainer: Fabrizio Fresco < fabrizio . fresco at gmail . com >
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Yann Pomarede < yann . pomarede at gmail dot com >


pkgname=brutefir
pkgver=1.0o
pkgrel=1
pkgdesc="Is a software convolution engine, a program for applying long FIR filters to multi-channel digital audio, either offline or in realtime."
arch=('i686' 'x86_64' 'armv7h' )
url="http://www.ludd.luth.se/~torger/brutefir.html"
license=('GPL')
depends=('fftw' 'alsa-lib' 'jack')
source=(http://www.ludd.luth.se/~torger/files/$pkgname-$pkgver.tar.gz)
md5sums=(825b3d4d9fdfb282eda7c90bab235eac)

build() {

  rm -rf "${srcdir}/${pkgname}-${pkgver}-build"
  cp -r "$srcdir/${pkgname}-${pkgver}" "${pkgname}-${pkgver}-build"
  cd "${pkgname}-${pkgver}-build"

  sed 's@/usr/local@/usr@' -i Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-build"
  make DESTDIR="$pkgdir/" install
}
