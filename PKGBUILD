# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=duplicacy
pkgver=2.1.1_1
_pkgver=2.1.1
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64' 'i686')
url="https://duplicacy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gilbertchen/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=('63f45389429cac27ef7ba54216fc2f696a0ffbee86c0316b1c4913aef66f1105')

prepare() {
  cd "$pkgname-$_pkgver/$pkgname"

  mkdir -p "src/github.com/gilbertchen"
  ln -sf "$srcdir/$pkgname-$_pkgver" "src/github.com/gilbertchen/$pkgname"

  GOPATH="$srcdir/$pkgname-$_pkgver/$pkgname" go get -d -v
}

build() {
  cd "$pkgname-$_pkgver/$pkgname"

  GOPATH="$srcdir/$pkgname-$_pkgver/$pkgname" go build -x
}

check() {
  cd "$pkgname-$_pkgver/$pkgname"

  GOPATH="$srcdir/$pkgname-$_pkgver/$pkgname" go test -v -x
}

package() {
  cd "$pkgname-$_pkgver"

  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
