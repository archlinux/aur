# Maintainer: gunererd <your-email@example.com>
pkgname=helix-health
pkgver=1.0.1
pkgrel=1
pkgdesc="Overengineered helix --health"
arch=('x86_64')
url="https://github.com/gunererd/helix-health"
license=('MIT')
depends=('helix')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4c2db5a91f1195bda83896432e1f8ee4074ee86f8dc42005ed8ee7e2b0e60db8')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o helix-health
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 helix-health "$pkgdir/usr/bin/helix-health"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
