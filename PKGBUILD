# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=tinyfeed
pkgver=1.3.0
pkgrel=3
pkgdesc="Generate a static HTML page from a collection of feeds wtih a simple CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/TheBigRoomXXL/tinyfeed"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/TheBigRoomXXL/tinyfeed.git#tag=v$pkgver")
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
