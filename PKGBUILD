# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gocognit
pkgver=1.2.1
pkgrel=2
pkgdesc="Calculates cognitive complexities of functions (and methods) in Go source code. (Golang cognitive complexity)"
arch=('x86_64' 'aarch64')
url="https://github.com/uudashr/gocognit"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='5b8ec1cd6a28032e4e38356b6e913ea5fe7a8d63'
source=("git+https://github.com/uudashr/gocognit.git#commit=$_commit")
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
    -o $pkgname \
    ./cmd/gocognit
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
