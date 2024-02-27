pkgname=swag
pkgver=1.16.3
pkgrel=2
pkgdesc='Automatically generate RESTful API documentation with Swagger 2.0 for Go.'
arch=('x86_64')
url="https://github.com/swaggo/swag"
license=('MIT')
makedepends=('go')
source=("https://github.com/swaggo/swag/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c297b7e502fb7884282d4fa074af4fc015a8be26a4a47116ed53746596dd3078')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 swag "$pkgdir/usr/bin/swag"
}
