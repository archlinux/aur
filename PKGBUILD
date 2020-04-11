# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=duplicacy
pkgver=2.5.0
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64' 'i686')
url="https://duplicacy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gilbertchen/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d13b4a7d5eee9b44a7f2a2332b65d8d89551f32b2af0f67bb9485ce1481492a9')

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
