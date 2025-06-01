# Maintainer: Your Name <your.email@example.com>

pkgname=rpc-gateway-git
pkgver=0.0.1.r309.d1c47c9
pkgrel=1
pkgdesc="RPC Gateway acts as a failover proxy routing ETH RPC requests across configured RPC nodes"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/rpc-gateway"
license=('MIT')
makedepends=('go')
source=("$pkgname::git+https://github.com/kewlfft/rpc-gateway.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOOS=linux
  go build -o rpcgateway ./cmd/rpcgateway/main.go
}

package() {
  cd "$pkgname"
  install -Dm755 rpcgateway "$pkgdir/usr/bin/rpcgateway"
  install -Dm644 example_config.yml "$pkgdir/etc/rpc-gateway/config.yml.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
