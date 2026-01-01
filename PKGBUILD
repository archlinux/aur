# Maintainer: f0ruD <fzero@rubi.gd>
pkgname=witr
pkgver=0.1.5
pkgrel=1
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
  export CGO_ENABLED=0
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
  install -Dm644 docs/witr.1 "$pkgdir/usr/share/man/man1/witr.1"
}
sha256sums=('e288b31e15730a91bbedef670c172b485c11177976055ce7ea08093e34dfa4e4')
