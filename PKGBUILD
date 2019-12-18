# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=hexyl-git
pkgdesc="A command-line hex viewer"
pkgrel=1
pkgver=0.6.0.106
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

	printf "%s.%s" "$(grep -m1 '^version =' Cargo.toml | cut -d\" -f2)" "$(git rev-list --count HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	env CARGO_INCREMENTAL=0 CARGO_TARGET_DIR= \
		cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "${srcdir}/${pkgname}/release/hexyl" "${pkgdir}/usr/bin/hexyl"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
