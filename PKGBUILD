# Maintainer: Isaac Ruben <isaac@rubenfamily.com>
pkgname=similar-sort-git
pkgver=r49.c850114
pkgrel=1
pkgdesc="sort strings according to edit distance"
arch=('x86_64')
url="https://github.com/BrianHicks/similar-sort"
license=('CC-BY-SA-4.0')
groups=()
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/BrianHicks/similar-sort.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
		cd "$srcdir/${pkgname%-git}"
		install -Dm0755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}
