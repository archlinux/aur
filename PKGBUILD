# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts
pkgver=0.5.8
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6aac7dd4628a17deda0de7444c6ad928ecd3df22af3a70e06a1f2a86a4c5a3a4')

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
