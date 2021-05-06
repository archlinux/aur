# Maintainer: Avery Murray <averylapine@protonmail.com>

pkgname=rfetch
pkgver=0.4.0
pkgrel=1
pkgdesc="No dependancy fetch program written in Rust"
arch=('x86_64' 'i686' 'pentiumm4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/caverym/rfetch"
license=('MIT')
makedepends=('rust' 'gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/rfetch/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f26ef74a4f5b5c088e47c1c7b810bb3ecf3e00633700499f0bcae4e08ea7fa01')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release --locked
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "target/release/rfetch" "${pkgdir}/usr/bin/rfetch"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
