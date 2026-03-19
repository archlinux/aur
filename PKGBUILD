# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=superharness
pkgver=0.3.3
pkgrel=1
pkgdesc='Autonomous multi-agent orchestrator for AI coding agents via tmux'
arch=('x86_64')
url='https://github.com/backmeupplz/superharness'
license=('MIT')
depends=('tmux')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/superharness/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2cff004ce13f9a09ba075d9708487e63e4b3878e2cb34d467063d03ea57dd271')

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
