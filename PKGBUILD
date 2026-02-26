pkgname=checkpoint
pkgver=0.1.2
pkgrel=1
pkgdesc="Debug TypeScript/JavaScript via TUI. Checkpoint functions, edit state, skip execution."
arch=('x86_64')
url="https://github.com/ErenayDev/checkpoint-ts"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ErenayDev/checkpoint-ts/archive/v$pkgver.tar.gz")
sha256sums=('35809ee87614c01f2f47cc6cb7ee6c014da89fd45d310502838f76a804f116ba')

prepare() {
  cd "checkpoint-ts-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "checkpoint-ts-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "checkpoint-ts-$pkgver"
  install -Dm755 "target/release/checkpoint-ts" "$pkgdir/usr/bin/checkpoint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
