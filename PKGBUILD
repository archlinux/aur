# Maintainer: ANKDDEV <dev.ankddev@outlook.com>
# https://github.com/ankddev/PKGBUILDs

pkgname=msedit
_pkgname=edit
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple editor for simple needs (Microsoft Edit)"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/edit"
license=('MIT')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d91205513b245bf4ed1127c35d148cac4f7dafd22b071fe3443d080bbda4b9ef')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/edit" "$pkgdir/usr/bin/msedit"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

