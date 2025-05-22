# Maintainer: Dian M Fay <dian.m.fay@gmail.com>

pkgname=pdot-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Explore your PostgreSQL databases with dot or mermaid digraphs'
arch=(x86_64)
url=https://gitlab.com/dmfay/pdot
license=(MPL2)
makedepends=(
	git
	cargo
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
options=(
	!lto
)
source=(
	"git+https://gitlab.com/dmfay/pdot.git"
)
sha256sums=('SKIP')

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --release
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
