# Maintainer: Avery Murray <averylapine@protonmail.com>

pkgname=rfetch
pkgver=0.3.0
pkgrel=1
pkgdesc="No dependancy fetch program written in Rust"
arch=('x86_64' 'i686' 'pentiumm4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/caverym/rfetch"
license=('MIT')
makedepends=('rust' 'gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/rfetch/archive/refs/tags/0.3.0.tar.gz")
sha256sums=('ff8fdb0263ef13137ae22c003b89886751f0853812512d31358f1dbf4d7700d9')

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
