# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

_pkgname=cup
pkgname=$_pkgname-docker
pkgver=1.1.2
pkgrel=1
pkgdesc="Cup is the easiest way to check for container image updates."
url="https://github.com/sergi0g/cup"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sergi0g/cup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47d60e4fb427f3e486e47680cd0f57d518c5c826768a4e552ef87e38b45897aa')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
