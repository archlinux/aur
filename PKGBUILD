# Maintainer: Tal <talwat321@gmail.com>
pkgname=lowfi
pkgver=1.4.0
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('any')
url="https://github.com/talwat/$pkgname"
license=('MIT')
makedepends=('cargo' 'alsa-lib' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('75841aecb26e31aa8557e599ed6bd982d9ef8ccea93028d0ffd0b15eae082ebfa1c61ffb848ca07051b11cdb8b445ddcedcef6aa1be9a015de7e21f2ceb1a37b')

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

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

