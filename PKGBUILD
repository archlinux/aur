# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=cargo-docset
pkgver=0.3.1
pkgrel=1
pkgdesc="Cargo subcommand to generate a Dash/Zeal docset for your Rust packages"
url="https://github.com/Robzz/${pkgname}"
arch=("x86_64")
license=("MIT")
depends=("cargo" "sqlite")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('931828ce74bd8e6a1ce057c33a6d049e82b7b8728b17a1f38f598f4f4f10ef77578f3d4f4309e9a63568b837abfdb1c7a35347f56b2994681186d97ff0bbb258')

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
