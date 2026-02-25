# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=drumkit
pkgver=0.1.9
pkgrel=1
pkgdesc='Low-latency TUI MIDI drum sampler for electronic drum kits'
arch=('x86_64')
url='https://github.com/backmeupplz/drumkit'
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/drumkit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0333d5790fb0ff0b74d972bf0a03278292187246c072595567be529d48ad3fb2')

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
