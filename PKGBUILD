# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=mac-cleanup-go
pkgver=1.6.0
pkgrel=2
pkgdesc="TUI macOS cleaner that scans caches/logs, shows sizes/paths, lets you select what to delete before Trash."
arch=('x86_64' 'aarch64')
url="https://github.com/2ykwang/mac-cleanup-go"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='f93e41122b707b7bc39cb3fd3c6a2e25454de373'
source=("git+https://github.com/2ykwang/mac-cleanup-go.git#commit=$_commit")
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
