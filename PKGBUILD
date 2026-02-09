# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gocognit
pkgver=1.2.0
pkgrel=3
pkgdesc="Calculates cognitive complexities of functions (and methods) in Go source code. (Golang cognitive complexity)"
arch=('x86_64' 'aarch64')
url="https://github.com/uudashr/gocognit"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/uudashr/gocognit.git#tag=v$pkgver")
sha256sums=('SKIP')

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
