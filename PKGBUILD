# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=ts
pkgver=1.0.2
pkgrel=1
pkgdesc="A Unix batch system where the tasks spooled run one after the other"
arch=('i686' 'x86_64')
url="https://viric.name/soft/ts/"
license=('GPL2')
source=(
  "https://viric.name/soft/ts/ts-${pkgver}.tar.gz"
  "ts-to-tsp.patch"
)
sha256sums=('f73452aed80e2f9a7764883e9353aa7f40e65d3c199ad1f3be60fd58b58eafec'
            '4ced7e1810d89e5b24686108a25e60eb8079748681e13f87ee2dee5554b77ed1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/ts-to-tsp.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -D --mode=0644 TRICKS "$pkgdir/usr/share/doc/tsp/TRICKS"
}
