# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=gitui-git
_filename=gitui
pkgver=0.11.0.r25.g0299020
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2' 'libxcb')
conflicts=('gitui')
makedepends=('git' 'cargo' 'python') # xcb crate needs python
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname/target/release/$_filename" "$pkgdir/usr/bin/$_filename"
  install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$_filename/LICENSE"
}
