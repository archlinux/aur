# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>
pkgname=netspy
pkgver=0.0.2
pkgrel=2
pkgdesc="一款快速探测内网可达网段工具"
arch=("x86_64")
url="https://github.com/shmilylty/netspy"
license=("custom")
depends=('glibc')
makedepends=(go)
optdepends=()

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1afdb7a00b7a1b82a64cc860eb5e11056f90c4bb829559a0984ed2b0d52f867c')


prepare() {
  cd "$pkgname-$pkgver"
  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build "$pkgdir"/usr/bin/$pkgname
}
