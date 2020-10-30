# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=streamdeck
pkgver=1.2.0
pkgrel=1
pkgdesc="Utility to control Elgato StreamDeck on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
depends=(hidapi)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f979d04d3fb02103a9fdcaaa645dc821913ec82bd299bfc3451f7c6e9e4465338c91a549a244e27b77f343849a3f45186c7ebb4454c93fb4c764e666fcb8beb1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/cmd/streamdeck"
	go build -a -v \
		-ldflags="-X main.version=${pkgver}" \
		-mod=readonly
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/cmd/streamdeck/streamdeck"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgname}-${pkgver}/LICENSE"
}
