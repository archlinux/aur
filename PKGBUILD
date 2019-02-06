# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=hexyl-git
pkgdesc="A command-line hex viewer"
pkgrel=1
pkgver=0.4.0.71
arch=('i686' 'x86_64')
conflicts=("hexyl")
provides=("hexyl")
url="https://github.com/sharkdp/hexyl"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=('rust-src: rust std source code')
source=("${pkgname}::git+https://github.com/sharkdp/hexyl")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	echo "$(grep -m1 '^version =' Cargo.toml | cut -d\" -f2).$(git rev-list --count HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"

	install -D -m755 "${srcdir}/${pkgname}/target/release/hexyl" "${pkgdir}/usr/bin/hexyl"
}
