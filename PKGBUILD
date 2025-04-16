# Maintainer: Denis Proskurin <dpvpro at gmail dot com>

pkgname=deber
pkgver=1.4.5
# pkgver=1.1.1.r5.g058b512
pkgrel=2
pkgdesc="Debian packaging with Docker"
arch=('x86_64')
url="https://github.com/dpvpro/deber"
license=("MIT")
depends=('docker')
makedepends=('go')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d311fcf3967473e5477e1f185c4f6051240f6d291d9b103ab621b37233b32b07')

# pkgver() {
#         cd "${srcdir}/${pkgname}-${pkgver}"
#         git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -buildmode=pie
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

