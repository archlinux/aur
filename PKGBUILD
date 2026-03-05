# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=drumkit
pkgver=0.1.13
pkgrel=1
pkgdesc='Low-latency TUI MIDI drum sampler for electronic drum kits'
arch=('x86_64')
url='https://github.com/backmeupplz/drumkit'
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/drumkit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef80f300ff49f7ec7de4fabdce9eed5b78f64f48dd50d19aedbb3f2a93e06507')

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
