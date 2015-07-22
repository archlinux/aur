# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=ts
pkgver=0.7.5
pkgrel=1
pkgdesc="A Unix batch system where the tasks spooled run one after the other"
arch=('i686' 'x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL2')
source=("http://vicerveza.homeunix.net/~viric/soft/ts/${pkgname}-${pkgver}.tar.gz")
sha256sums=('216d09dcfbae2f9bfea7582a71494172fe91c33d65499ea01b3bcac0600de96d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|$(PREFIX)/man/man1|$(PREFIX)/share/man/man1|g' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -D --mode=0644 TRICKS "$pkgdir/usr/share/doc/ts/TRICKS"
}
