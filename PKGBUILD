# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=redis_tui
pkgver=0.2.4
pkgrel=4
pkgdesc="Redis terminal application"
arch=('x86_64' 'aarch64')
url="https://github.com/mat2cc/redis_tui"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='9c8b777605f71b134db1629946e65c522f54be30'
source=("git+https://github.com/mat2cc/redis_tui.git#commit=$_commit")
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
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
