# Maintainer: gomanager <gomanager@generated>
pkgname=protolock
pkgver=0.17.0
pkgrel=2
pkgdesc="Protocol Buffer companion tool. Track your .proto files and prevent changes to messages and services which impact API compatibility."
arch=('x86_64' 'aarch64')
url="https://github.com/nilslice/protolock"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/nilslice/protolock.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/protolock
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
