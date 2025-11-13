# Maintainer: Lysec

pkgname=swiftfetch
pkgver=1.2.1
pkgrel=1
pkgdesc="A fast and efficient fetch utility written in Rust"
arch=('x86_64')
url="https://github.com/Ly-sec/swiftfetch"
license=('MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(
  rust
  cargo
)
install="$pkgname.install"
source=("https://github.com/Ly-sec/swiftfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47988a9dfbc41ffd7d86532e9ae0eecb7112793859ec5a9582add1e52d7a745d')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  rm -f flake.nix flake.lock 2>/dev/null || true
  install -Dm755 target/release/swiftfetch "$pkgdir/usr/bin/swiftfetch"

  install -Dm644 config/config.toml "$pkgdir/usr/share/$pkgname/config.toml"
}
