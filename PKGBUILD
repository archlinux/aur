# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=gitui
pkgver=0.10.1
pkgrel=2
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2' 'libxcb')
conflicts=('gitui-git')
makedepends=('cargo' 'python') # xcb crate needs python
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2d6fa87d88002716cf0fedef9d4332b7212ee05fbfa4b8c536ae4270bef99bce')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
