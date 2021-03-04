# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=gitui
pkgver=0.12.0
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2' 'libxcb')
conflicts=('gitui-git')
makedepends=('cargo' 'python') # xcb crate needs python
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('061536ecd2c9f9f52d4aecaece86e1e3c6fd1b88f25ce11483a783b800b9ec9e')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
