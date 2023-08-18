# Maintainer: Isaac Ruben <isaac@rubenfamily.com>
pkgname=marksage-git
pkgver=r94.35ce98d
pkgrel=1
pkgdesc="A tool for managing markdown files through AST transformations"
arch=('x86_64')
url="https://github.com/isaec/marksage"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/isaec/marksage.git")
noextract=()
md5sums=('SKIP')

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
