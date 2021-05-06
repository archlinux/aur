# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=2.11
pkgrel=1
pkgdesc="Count source lines of code in a project."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('151efcf21398f638c4bc9ce33d59e47764573404f80617a843dd138223e8a3be2e05e2031f5dcdeb1827737e119c5a53b056f33af60bc2b16b890e97a31e4867')

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

  make loccount loccount.1
}

package() {
  cd "$pkgname-$pkgver"

  install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
