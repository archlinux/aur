# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lowcharts
pkgver=0.5.9
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cf8920447a333adceeec3a1f0b48db9e4ef6cf79b24a46540125e1f2f4acea0f')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

package() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --frozen --offline --all-features --root "${pkgdir}/usr/" --path .
	
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
