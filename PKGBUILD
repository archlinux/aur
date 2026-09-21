pkgname=tempesta
pkgver=0.2.0
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("ce0d64b5639082a423e8c808518f60d29ca1604b23692cce4f2c4fd147e98e93")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tempesta"
  "target/release/tempesta" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tempesta"
  "target/release/tempesta" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tempesta"
  "target/release/tempesta" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/tempesta.fish"
  "target/release/tempesta" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/t"
  "target/release/tempesta" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_t"
  "target/release/tempesta" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/t.fish"
  "target/release/tempesta" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tmps"
  "target/release/tempesta" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tmps"
  "target/release/tempesta" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/tmps.fish"
  ln -s tempesta "$pkgdir/usr/bin/t"
  ln -s tempesta "$pkgdir/usr/bin/tmps"
}
