# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=rcs-fast-import
pkgver=1.2
pkgrel=1
pkgdesc="Unpack a Git fast-import stream into an RCS file tree"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('xmlto')
depends=('python' 'rcs')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('1909cced202cc537b01bce0c445fef2e6c1f6816d34f11264249b006147347199b420c897f3058819a2361e3f5391b37236bb60a972226db4ca8bd4c504dce35')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
