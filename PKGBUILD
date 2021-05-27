# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=streamdeck
pkgver=1.5.0
pkgrel=1
pkgdesc="Utility to control Elgato StreamDeck on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
depends=(hidapi)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b925aee256d427eebff433cd2d73d35cec960775eb9d3d842a097adc6707197a73067049045481b7ae76a2d926eeca65cb48a3996e61ecbf35b095ea13261d03')

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
