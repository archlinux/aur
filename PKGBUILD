# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=redis_tui
pkgver=0.2.4
pkgrel=3
pkgdesc="Redis terminal application"
arch=('x86_64' 'aarch64')
url="https://github.com/mat2cc/redis_tui"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/mat2cc/redis_tui.git#tag=v$pkgver")
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
