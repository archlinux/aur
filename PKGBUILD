# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wminet
pkgver=3.0.0
pkgrel=2
pkgdesc="A dock app for monitoring internet connections"
url="http://www.swanson.ukfsn.org/#wminet"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
source=("http://www.swanson.ukfsn.org/wmdock/wminet-3.0.0.tar.gz"
        list.patch)
md5sums=('78a5b269591633e20ced393bc4743f54'
         '134670f8b7923ded394a1c00c6a6ba85')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i ../list.patch
  autoreconf -fiv
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: set sw=2 et:
