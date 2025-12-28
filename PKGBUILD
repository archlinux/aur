# Maintainer: f0rud <f0rud@example.com>
pkgname=witr
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool to determine why a process is running."
arch=('x86_64' 'aarch64')
url="https://github.com/pranshuparmar/witr"
license=('Apache-2.0')
makedepends=('go' 'git')
conflicts=('witr-bin')
provides=('witr')
source=("git+https://github.com/pranshuparmar/witr.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/witr"
  
  export CGO_ENABLED=0
  export GOBIN="$pkgdir/usr/bin"
  
  # Install the binary
  go install -trimpath -ldflags "-s -w -X main.version=v$pkgver" ./cmd/witr
  
  # Install License and README
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
