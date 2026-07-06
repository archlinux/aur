# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=dnsglobe
pkgver=0.3.0
pkgrel=1
pkgdesc="Global DNS propagation checker TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/514-labs/dnsglobe"
license=('MIT')
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('e5ff38e8ca48836ed39b7835e108756119af5a25a7a4002d73d959c5134d6ba9')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
