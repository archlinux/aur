# Maintainer: f0rud <f0rud@example.com>
pkgname=witr
pkgver=0.1.1
pkgrel=2
pkgdesc="A tool to determine why a process is running."
arch=('x86_64' 'aarch64')
url="https://github.com/pranshuparmar/witr"
license=('Apache-2.0')
makedepends=('go' 'git')
conflicts=('witr-bin')
provides=('witr')
source=("git+https://github.com/pranshuparmar/witr.git#tag=v${pkgver}")

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -trimpath -ldflags "-s -w -X main.version=v$pkgver" ./cmd/witr
}

# check() {
#   cd "$pkgname"
#   go test ./...
# }

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=('e2a392d74cd44af8ecc0c84a4a3301135d96c45aa59dd7e7c190a581ce31f888')
