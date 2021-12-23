# Maintainer: Avery Murray <averylapine@protonmail.com>

pkgname=rfetch
pkgver=0.4.2
pkgrel=1
pkgdesc="No dependancy fetch program written in Rust"
arch=('x86_64' 'i686' 'pentiumm4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/caverym/rfetch"
license=('MIT')
makedepends=('rust' 'gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/rfetch/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c44f94341d1385f0e7ad1cc87756863dca1d9e5020b6cb75f93e8b1996c5cf94')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "target/release/rfetch" "${pkgdir}/usr/bin/rfetch"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
