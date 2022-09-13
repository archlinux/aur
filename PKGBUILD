# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts
pkgver=0.5.4
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('76d72bfc1ea6f266a1b2d3059555d81c0428a079dfbe13694edc7347ec1ce218')

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cargo test --locked --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	cargo install --no-track --locked --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
	
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
