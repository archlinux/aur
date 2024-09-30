# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=rcs-fast-import
pkgver=1.4
pkgrel=1
pkgdesc="Unpack a Git fast-import stream into an RCS file tree"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoctor')
depends=('python' 'rcs')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-Fix-a-fat-finger-typo-breaking-manpage-file-name.patch)
b2sums=('e70f1fec45607fad07ee7e1944a94019c0fbb8dcd7d95787a95d28d6460dfa6d0248c5c65dfebc22b5640b5a2aaad79995a9f9671224f12d125dd249246be5cc'
        '57144d70dbcf4d1a406d9047f1bf39f5c22c3e4dc65b380e4110273c4c6acb320f7c1543feea1adee73bd8a7a7c98835ac39e6114fb30f4bfd01ceb92799c35a')

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
