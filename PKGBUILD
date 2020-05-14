# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ponzu
pkgver=0.11.0
pkgrel=5
pkgdesc="Headless CMS with automatic JSON API. Featuring auto-HTTPS from Let's Encrypt, HTTP/2 Server Push, and flexible server framework written in Go"
arch=('i686' 'x86_64')
url='https://docs.ponzu-cms.org'
license=('BSD')
makedepends=('go-pie' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ponzu-cms/ponzu/archive/v${pkgver}.tar.gz")
sha256sums=('e2754727e1d16df6e13721316a65171c4b48ca02843e6f9a30eb9902ca23a266')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "$pkgname-$pkgver/cmd/ponzu"
  go build -v -o "../../$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  go clean -modcache # clean modcache
}