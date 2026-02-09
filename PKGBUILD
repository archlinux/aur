# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=mac-cleanup-go
pkgver=1.3.11
pkgrel=3
pkgdesc="TUI macOS cleaner that scans caches/logs, shows sizes/paths, lets you select what to delete before Trash."
arch=('x86_64' 'aarch64')
url="https://github.com/2ykwang/mac-cleanup-go"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/2ykwang/mac-cleanup-go.git#tag=v$pkgver")
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
