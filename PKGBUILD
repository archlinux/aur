# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=errcheck
pkgver=1.9.0
pkgrel=1
pkgdesc="A program for checking for unchecked errors in go programs."
arch=('x86_64')
url="https://github.com/kisielk/errcheck"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('99e83004c6a265d4a0808822425c7676372d2db5ce511936ddf3dd84877dc3aeb6bbc6ae5d7a9f327e27ebbf533a06f2b0677e808999b338c8341fbf8eab577a')

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
