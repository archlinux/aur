# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=2.15
pkgrel=2
pkgdesc="Count source lines of code in a project."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('1b9bb90a4c028d8cad2c718e9c76dc21b379eb42144a76086228fcb0b62cbc4c2644f762a1cc29b2569e752c743ba5b9915b4ed9c488c67822c5f5c0a692a018')

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

  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
