# Maintainer: gomanager <gomanager@generated>
pkgname=goben
pkgver=1.0.2
pkgrel=2
pkgdesc="goben is a golang tool to measure TCP/UDP transport layer throughput between hosts."
arch=('x86_64' 'aarch64')
url="https://github.com/udhos/goben"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/udhos/goben.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o ./cmd/goben/$pkgname \
    ./cmd/goben
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 cmd/goben/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
