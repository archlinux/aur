# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=eelu-login
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="A command-line tool that allows staff and students to log in to the Egyptian E-Learning University Moodle platform quickly and easily through the command-line interface."
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/anas-elgarhy/eelu-login"
license=('MIT OR Apache-2.0')
provides=(eelu-login)
replaces=(eelu-login)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()

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
}
sha256sums=('e48bf9bb49a7c6497bbdd91f9c7f62cbdf9e4536ec990a0ec44bc09547b0a9eb')
