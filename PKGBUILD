# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=streamdeck
pkgver=1.2.2
pkgrel=1
pkgdesc="Utility to control Elgato StreamDeck on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
depends=(hidapi)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9625ac71b347a27a3730be343f983c8b6523177d2207dc90334f7c0496602d4c0aa48d9de6ea0510fc2ef778f408cef8bfdcc163c586d6778ab20c43a16a10cf')

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
