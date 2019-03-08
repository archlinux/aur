# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=2.3
pkgrel=1
pkgdesc="Count source lines of code in a project."
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("$url$pkgname-$pkgver.tar.gz")
sha512sums=('a1e9f29534e93061407d2a63f3ec4349590d9c46cf595f5265c7b7c5e06ef634eb953e64118c64cac2d185db5bbd8dfebfcd96cd71018283dbf9aeedfd573474')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"

  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
