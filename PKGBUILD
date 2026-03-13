# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=superharness
pkgver=0.2.0
pkgrel=1
pkgdesc='Autonomous multi-agent orchestrator for AI coding agents via tmux'
arch=('x86_64')
url='https://github.com/backmeupplz/superharness'
license=('MIT')
depends=('tmux')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/superharness/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e16e973747b98a673a97f9226d3906673efa6cd01c2f9fe04d6e54cfe5c9a79')

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
