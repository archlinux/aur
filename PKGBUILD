# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts
pkgver=0.5.6
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('17950802cfec6a99248004677a9c43175dddf28a0552f6f2bbdedcebcea96be2')

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cargo test --locked --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	cargo install --no-track --locked --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
	
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
