# Maintainer: Elton Law <eltonlaw296@gmail.com>
# Contributor: Elton Law <eltonlaw296@gmail.com>
pkgname=tui-1password-git
pkgver=v0.1.1.r5
pkgrel=1
pkgdesc="1password text user interface wrapper around the official CLI."
arch=('x86_64')
url='https://github.com/eltonlaw/tui-1password'
license=('MIT')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/eltonlaw/tui-1password")
sha1sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  RUSTUP_TOOLCHAIN=stable \
  CARGO_TARGET_DIR=target \
      cargo build --frozen --release --all-features
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tui-1password"
}
