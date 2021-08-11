# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-docset
pkgver=0.2.1
pkgrel=3
pkgdesc="Cargo subcommand to generate a Dash/Zeal docset for your Rust packages"
url="https://github.com/Robzz/${pkgname}"
arch=("x86_64")
license=("MIT")
depends=("cargo" "sqlite")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('2ee59098d4635b9a6e348312874f1f04e26d3b3b8425aad491a4053c6f49b5cb22e94d9f2d6fce334d238e006f558a3d13e94ceac9e7ab8dd4925ca9fb960df2')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# vim: ts=2 sw=2 et:
