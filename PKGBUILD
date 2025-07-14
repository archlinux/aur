# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rust-i18n-cli
pkgver=3.1.5
pkgrel=1
pkgdesc="cargo-i18n tool for the rust-i18n crate"
arch=('x86_64')
url="https://github.com/longbridge/rust-i18n"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ca949a9f9b5b773d01253366e2b84702aae20765253faefc5dde50fea5a3fdde')

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
