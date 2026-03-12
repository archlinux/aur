pkgname=checkpoint
pkgver=0.2.0
pkgrel=0.1
pkgdesc="Debug TypeScript/JavaScript via TUI. Checkpoint functions, edit state, skip execution."
arch=('x86_64')
url="https://github.com/ErenayDev/checkpoint-ts"
license=('MIT')
depends=()
makedepends=('cargo')
source=("checkpoint-ts-0.2.0-beta.1.tar.gz::https://github.com/ErenayDev/checkpoint-ts/archive/v0.2.0-beta.1.tar.gz")
sha256sums=('30bcbe75fe136c62cd84c262dbb2f5314e5b2b0c48f1f231e0ad6ee6b9f959a4')

prepare() {
  cd "checkpoint-ts-0.2.0-beta.1"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "checkpoint-ts-0.2.0-beta.1"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "checkpoint-ts-0.2.0-beta.1"
  install -Dm755 "target/release/checkpoint-ts" "$pkgdir/usr/bin/checkpoint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
