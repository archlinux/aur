# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
_pkgname=xdg-terminal-exec
pkgname=xdg-terminal-exec-mkhl
pkgver=0.2.0
pkgrel=2
epoch=
pkgdesc="xdg-terminal-exec rewritten in rust"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/xdg-terminal-exec/"
license=(GPL-3.0-only)
groups=()
depends=(glibc gcc-libs)
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=(xdg-terminal-exec)
conflicts=(xdg-terminal-exec xdg-terminal-exec-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mkhl/$_pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('928dd19a248eb1a7ce09effbccc472558854bc41e0c9a8040bf818c3c7129d4e360d8e4dc630bee294edf404b029cd1178a23847983aedb7751d9e36d6caf985')
validpgpkeys=()

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
