# Maintainer: a821 at mail de
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=errcheck
pkgver=1.10.0
pkgrel=1
pkgdesc="A program for checking for unchecked errors in go programs."
arch=('x86_64')
url="https://github.com/kisielk/errcheck"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c4f2fc0cfdb59eaee53ab1200d9882ae06f2e0d794bc9fe6136c4fd7f3b0dd77a2d282be2dd616443f5a3ce05944e28b1802030f28f29d4f2b191be4ab7ca3aa')

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
