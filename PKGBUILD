# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=streamdeck
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility to control Elgato StreamDeck on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
depends=(hidapi)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('0f93d4a2dabd44588ab663a7c1f1bd745f347d69b274ab71cf533e84989b5b3705ff61d7d8b82535f0f714885b0127dfb858991de38efe4f319cb11c7144976b')

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
