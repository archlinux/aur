# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=superharness
pkgver=0.3.2
pkgrel=1
pkgdesc='Autonomous multi-agent orchestrator for AI coding agents via tmux'
arch=('x86_64')
url='https://github.com/backmeupplz/superharness'
license=('MIT')
depends=('tmux')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/superharness/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b171a94c478c013522b4fea5bb7f8281772521467a52f811d76efcaf8f01f84')

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
