# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=truss
pkgver=0.3.1
pkgrel=4
pkgdesc="Truss helps you build go-kit microservices without having to worry about writing or maintaining boilerplate code."
arch=('x86_64' 'aarch64')
url="https://github.com/metaverse/truss"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
_commit='fcd9ff140d5e892d66cd5b03c9510c982eca5bc9'
source=("git+https://github.com/metaverse/truss.git#commit=$_commit")
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
    -o cmd/truss/$pkgname \
    ./cmd/truss
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 cmd/truss/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
