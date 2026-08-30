# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=goben
pkgver=1.0.3
pkgrel=2
pkgdesc="goben is a golang tool to measure TCP/UDP transport layer throughput between hosts."
arch=('x86_64' 'aarch64')
url="https://github.com/udhos/goben"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='45b8e7ac798ba55ccf62387a95e50ad325080e92'
source=("git+https://github.com/udhos/goben.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download
}

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
