# Maintainer: a821 at mail de
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=errcheck
pkgver=1.30.0
pkgrel=1
pkgdesc="A program for checking for unchecked errors in go programs."
arch=('x86_64')
url="https://github.com/kisielk/errcheck"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9750ff01141ef7b7488b2864db64cf8ecb3b4a84d60cb5d06c4dd09bb998808aa8a82f6be0fa6f2c464d2b86c26c3bab20733d0962b9bc6c0ae834259e154b70')

prepare() {
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ../build .
}

package() {
  install -Dm755 build/$pkgname -t "$pkgdir/usr/bin"
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
