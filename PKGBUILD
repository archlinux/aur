# Maintainer: zvdy <zzvdyy@gmail.com>

pkgname=parsero-go
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool for analyzing robots.txt files written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/zvdy/parsero-go"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zvdy/parsero-go/archive/v$pkgver.tar.gz")
sha256sums=('f5002ab43c5e4f8adfdbe96055b90c77a3e0ab07f4614573afc096a879d080aa')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  # Build from the cmd/parsero directory where main.go is located
  go build -o parsero-go ./cmd/parsero
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 parsero-go "$pkgdir/usr/bin/parsero-go"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}