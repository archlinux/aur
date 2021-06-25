# Maintainer: Lieven Moors <lievenmoors@protonmail.com>

pkgname=tuneit
pkgver=0.3
pkgrel=1
pkgdesc="A simple command-line instrument tuner"
arch=('i686' 'x86_64')
url="https://delysid.org/tuneit.html"
license=('GPL2')
depends=('jack' 'fftw')
provides=('tuneit')
source=("https://delysid.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('b22dcdc92982bcf56c4ae85d6b8e9b3b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/man_MANS=tuneit.1/aAM_LDFLAGS=-lm' src/Makefile.am
  autoreconf -i
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
