# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rust-i18n-cli
pkgver=4.2.2
pkgrel=1
pkgdesc="cargo-i18n tool for the rust-i18n crate"
arch=('x86_64')
url="https://github.com/longbridge/rust-i18n"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec9c89c5fe14aec927873019d531a2a1adeb23bce08173620607f3d174aa435d')

prepare() {
  cd "${pkgname%-cli}-$pkgver/crates/cli"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
}

build() {
  cd "${pkgname%-cli}-$pkgver/crates/cli"
  cargo build --release # --frozen
}

check() {
  cd "${pkgname%-cli}-$pkgver/crates/cli"
  cargo test # --frozen
}

package() {
  cd "${pkgname%-cli}-$pkgver"
  install -Dm 755 "target/release/cargo-i18n" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
