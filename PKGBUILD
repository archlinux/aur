# Maintainer: Simon Jackson <sizeak at gmail dot com>
pkgname=claude-commander
pkgver=0.9.0
pkgrel=1
pkgdesc='A high-performance terminal UI for managing Claude coding sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/sizeak/claude-commander'
license=('MIT')
depends=('tmux' 'git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sizeak/claude-commander/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a3b0e9d9817763deea693adffe55d94a230ee037724104ccdd2f932364e7714')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
