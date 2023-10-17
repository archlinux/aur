# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=fname
pkgver=0.4.1
pkgrel=2
pkgdesc=' Generate random, human-friendly names.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Splode/fname'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e5a22556adc08877e67cecb710342d4d225edfcc4b11163b2abbe2ccecbcda7')

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
