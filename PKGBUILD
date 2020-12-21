# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=gitui
pkgver=0.11.0
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2' 'libxcb')
conflicts=('gitui-git')
makedepends=('cargo' 'python') # xcb crate needs python
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba32583bb6afc3adac8fe78d8ce10fd127b2fe4f62bc24b301d1ffbfb838bf98')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
