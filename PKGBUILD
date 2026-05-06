# Maintainer: QwerProg
pkgname=bili-tools-git
pkgver=0.1.0.r1.b491f25
pkgrel=1
pkgdesc="B站直播开播工具 — 命令行一键开播/下播"
arch=('x86_64' 'aarch64')
url="https://github.com/QwerProg/bili-tools"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("git+https://github.com/QwerProg/bili-tools.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bili-tools"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bili-tools"
  cargo build --release --locked
}

package() {
  cd "$srcdir/bili-tools"
  install -Dm755 target/release/bt "$pkgdir/usr/bin/bt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
