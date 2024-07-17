# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

_pkgname=cup
pkgname=$_pkgname-docker
pkgver=2.0.0
pkgrel=2
pkgdesc="Cup is the easiest way to check for container image updates."
url="https://github.com/sergi0g/cup"
makedepends=('cargo')
arch=('x86_64' 'aarch64')
license=('MIT')
source=("https://github.com/sergi0g/cup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee8157317540ff2e1a30a7a8992ae76468d39546ad410254141cde50726c59af')

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
  install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
