# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=svg_to_ico
pkgver=1.3.1
pkgrel=1
pkgdesc="Convert SVG icons into Windows ICO files"
arch=(x86_64)
license=('MIT')
url="https://github.com/Ortham/svg_to_ico"
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ortham/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('23def49f56aef5c40ed86f8aad559d7bba87fc40a301e803252c6a9791abd72b')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target host-tuple --locked
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "${pkgbase}-${pkgver}"

	install -Dm755 \
		target/release/${pkgname} \
		"${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 \
		LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
