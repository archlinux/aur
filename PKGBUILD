# Maintainer: Lars Francke <lars.francke@stackable.tech>

_commit=3132db390f00b499ece9b99e81d5a71bcd7f826d
pkgname=stackablectl
pkgver=0.8.0
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
depends=('gcc-libs')
makedepends=('go' 'rust' 'git')
source=("$pkgname::git+https://github.com/stackabletech/stackablectl.git#commit=$_commit")
b2sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/stackablectl
}
