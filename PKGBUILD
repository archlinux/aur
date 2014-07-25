# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.4
pkgrel=1
url='http://practical-scheme.net/gauche/'
pkgdesc='R5RS Scheme implementation (provides gosh)'
depends=('gdbm' 'zlib' 'slib')
license=('BSD')
arch=('x86_64' 'i686')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha256sums=('7b18bcd70beaced1e004594be46c8cff95795318f6f5830dd2a8a700410fc149')

build() {
  cd "Gauche-$pkgver"

  [ $CARCH == 'i686' ] && ./configure --enable-multibyte=utf-8 --prefix=/usr \
    --enable-threads=none || ./configure --enable-multibyte=utf-8 \
    --prefix=/usr --enable-threads=pthreads
  make
}

package() {
  cd "Gauche-$pkgver"

  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
