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
  git
)
install="$pkgname.install"
source=("git+https://github.com/Ly-sec/swiftfetch.git#tag=v${pkgver}")
sha256sums=('451a7e293504f6426e97d515ffdbb7f6d3311612c15b672c56375bde6bb3d75d')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  rm -f flake.nix flake.lock 2>/dev/null || true
  install -Dm755 target/release/swiftfetch "$pkgdir/usr/bin/swiftfetch"

  install -Dm644 config/config.toml "$pkgdir/usr/share/$pkgname/config.toml"
}
