# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=fname
pkgver=0.3.0
pkgrel=2
pkgdesc=' Generate random, human-friendly names.'
arch=('any')
url='https://github.com/Splode/fname'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29c403ffc4c48a7b787ac855231b0792e212b74f7d23da19551548b3f1be4618')

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
