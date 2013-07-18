# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.3.3
pkgrel=1
url='http://practical-scheme.net/gauche/'
pkgdesc='R5RS Scheme implementation (provides gosh)'
depends=('gdbm' 'zlib' 'slib')
license=('BSD')
arch=('x86_64' 'i686')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha256sums=('3d8b70075faa0f7a24f8d112cc102ee3e1066680cdd19d324d59f33fab79caac')

build() {
  cd "$srcdir/Gauche-$pkgver"

  ./configure --prefix=/usr --enable-multibyte=utf-8 \
    --enable-threads=pthreads
  make
}
package() {
  cd "$srcdir/Gauche-$pkgver"

  make DESTDIR="$pkgdir" install-pkg install-doc
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
