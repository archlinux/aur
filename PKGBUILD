# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts
pkgver=0.5.2
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('79ef3d6bffa978d75e6924f89f6a8d68b5ca9a2e43cf0a4ce8e9214912e0c6ac')

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cargo test --locked --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	cargo install --no-track --locked --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
	
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
