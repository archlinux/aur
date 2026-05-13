# Maintainer: a821 at mail de
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=errcheck
pkgver=1.20.0
pkgrel=1
pkgdesc="A program for checking for unchecked errors in go programs."
arch=('x86_64')
url="https://github.com/kisielk/errcheck"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e4acbf08f556dcc7642c5683277f2018660538d2d80b6845c519173862f9dafb38ec9e2a8111dbe5a87e20198b8b31fea477199e03ec37081734c2d622cde7a5')

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
