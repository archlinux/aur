# Maintainer: Thomas <thomas at 6f dot io>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=panicparse
_pkgname=pp
pkgver=2.2.0
pkgrel=1
pkgdesc='Parses panic stack traces, densifies and deduplicates goroutines with similar stack traces. Helps debugging crashes and deadlocks in heavily parallelized process.'
arch=('x86_64')
url='https://github.com/maruel/panicparse'
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('de6057831198a1100c5fa86802bc4c19a48b64af5ebd23d8eb67708bc8048715')
conflicts=('pp')
provides=('pp')

prepare() {
  cd "$pkgname-$pkgver"

  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  go build -o bin/ -v "github.com/maruel/$pkgname/v2/cmd/$_pkgname"
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" "bin/$_pkgname"
}
