# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=grpcmd
pkgver=0.2.1
pkgrel=3
pkgdesc="A simple, easy-to-use, and developer-friendly CLI tool for gRPC."
arch=('x86_64' 'aarch64')
url="https://github.com/grpcmd/grpcmd"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/grpcmd/grpcmd.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
