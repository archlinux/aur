# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=1.1
pkgrel=1
pkgdesc="Count source lines of code in a project."
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("$url$pkgname-$pkgver.tar.gz")
sha512sums=('7c485b0fdf5b3256013cc395f6c7cea75d6f9c79e7e1ee0c6cf5e2c638eb9edff7f9c6d8757c4e08c4a488895e816b38a16296c501067942d2dc230b38673914')

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
