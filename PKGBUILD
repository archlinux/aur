# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='turbo'
pkgver=1.12.1
pkgrel=1
pkgdesc='Incremental bundler and build system optimized for JavaScript and TypeScript, written in Rust – including Turbopack and Turborepo.'
arch=('x86_64')
url='https://turbo.build'
license=('MPL')
provides=('turbopack' 'turborepo')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/vercel/turbo/archive/refs/tags/v${pkgver}.tar.gz"
)
makedepends=('cargo-nightly' 'protobuf' 'capnproto')
sha256sums=(
	'8b69e074a859e9ef82ca19a6d93179f860aa7bd4a938f82a5d199a20e9e29e87'
)

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p turbo
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
