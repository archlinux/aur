# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=streamdeck
pkgver=1.7.0
pkgrel=1
pkgdesc="Utility to control Elgato StreamDeck on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
depends=(hidapi)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('46d5c68212231ef10f00eea034353c3e42e211ac63c8461d3654c6f46e47f626f69e9564ba91165c8ef47ef0c53c3fbfbb7c9d8ca7c9550e830210e74075a5e5')

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
