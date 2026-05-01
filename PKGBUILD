# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pumba
pkgver=1.1.4
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers"
arch=('x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
makedepends=('go' 'git' 'golangci-lint')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d8506369411ed64eba882eb8bef68d667e5a5788ac1718d1b9571e8e5425a01d')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath"
  make
}

test() {
  cd "$pkgname-$pkgver"
  make test-coverage
}

package() {
  cd "$pkgname-$pkgver"
  make release
  install -Dm755 .bin/${pkgname}_linux_amd64 "$pkgdir"/usr/bin/$pkgname
}
