# Maintainer: Adam Harvey <adam@adamharvey.name>
pkgname=tuc
pkgver=0.11.0
pkgrel=1
epoch=
pkgdesc="A more powerful alternative to cut"
arch=("x86_64" "aarch64")
url="https://github.com/riquito/tuc"
license=('GPL3')
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/riquito/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('e8208e0cb92bd17b36e1d43f0ea9d45f4573222fa40ca576775b4ebbb6442adf')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "doc/tuc.1"
}
