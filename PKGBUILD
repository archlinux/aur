# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=duplicacy
pkgver=2.5.2
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64' 'i686')
url="https://duplicacy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gilbertchen/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9ea8527d5be2c73cc35bbf7ed91fc522509915fba3b34b259abb78563d95a6da')

prepare() {
  cd "$pkgname-$pkgver/$pkgname"

  mkdir -p "src/github.com/gilbertchen"
  ln -sf "$srcdir/$pkgname-$pkgver" "src/github.com/gilbertchen/$pkgname"

  GOPATH="$srcdir/$pkgname-$pkgver/$pkgname" go get -d -v
}

build() {
  cd "$pkgname-$pkgver/$pkgname"

  GOPATH="$srcdir/$pkgname-$pkgver/$pkgname" go build -x
}

check() {
  cd "$pkgname-$pkgver/$pkgname"

  GOPATH="$srcdir/$pkgname-$pkgver/$pkgname" go test -v -x
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
