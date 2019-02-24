# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=2.0
pkgrel=1
pkgdesc="Count source lines of code in a project."
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("$url$pkgname-$pkgver.tar.gz")
sha512sums=('fbeca20c8665eeb0a402e3b06622a6a24f6779122cb0d017608f778e8b7de675c6376b9a5832995ac7df8a619124f48937d34e77358af31561884d65f9d62618')

prepare() {
  mv "$pkgname-\"$pkgver\"" "$pkgname-$pkgver"
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
