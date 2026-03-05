# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=drumkit
pkgver=0.1.12
pkgrel=1
pkgdesc='Low-latency TUI MIDI drum sampler for electronic drum kits'
arch=('x86_64')
url='https://github.com/backmeupplz/drumkit'
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/drumkit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('480af22fcc82e443b69a7e8f1bcac87eb8ede0e8e684ccb7127546046a1e596b')

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
