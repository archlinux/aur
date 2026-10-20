# Maintainer: mustd
pkgname=mdpkg
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative multi-host package manager for Manjaro Linux via Markdown checklists"
arch=('x86_64' 'aarch64')
url="https://github.com/MustD/mdpkg"
license=('MIT')
depends=('pacman' 'pamac-cli' 'sudo')
optdepends=('npm: for global npm package management')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c47fca5179637a6af0f7becb0f59b539e01448c4a6afff6e5085ddbeaf0458f')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
