# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=fname
pkgver=0.2.1
pkgrel=2
pkgdesc=' Generate random, human-friendly names.'
arch=('any')
url='https://github.com/Splode/fname'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fdaaeec8bdba263131c4f9961237924763c2332745ae6732e70cee4e1a85a123')

build() {
	cd "${pkgname}-${pkgver}/cmd/${pkgname}"

	# Build package
	go build -o "${pkgname}"
}

package() {
	# Install binary
	install -Dm755 "${pkgname}-${pkgver}/cmd/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	cd "${pkgname}-${pkgver}"

	# Install LICENSE
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install README.md
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
