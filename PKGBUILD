# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=git-side
pkgver=0.3.0
pkgrel=1
pkgdesc="A Git subcommand that versions files that should not live in the main repository"
arch=('x86_64')
url="https://github.com/Solexma/git-side"
license=('MIT')
depends=('git' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Solexma/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e7a50bc32d9283ddb5451be38e3998fd691a0514e4e36107d4aea97b0362b550')

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

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
