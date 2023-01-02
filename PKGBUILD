# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts
pkgver=0.5.7
pkgrel=2
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2c02ac4de57d10b61ec6095f85c0f33327f9dad72f0416a1ff493187f6458cc9')

check() {
	cd "${pkgname}-${pkgver}"
	cargo test --locked --release
}

package() {
	cd "${pkgname}-${pkgver}"

	cargo install --no-track --locked --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
	
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
