# Maintainer: Denis Proskurin <dpvpro at gmail dot com>

pkgname=deber
pkgver=1.4.0
# pkgver=1.1.1.r5.g058b512
pkgrel=1
pkgdesc="Debian packaging with Docker"
arch=('x86_64')
url="https://github.com/dpvpro/deber"
license=("MIT")
depends=('docker')
makedepends=('go')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('53585c01011ebbe4d168983b0a2f88af0c7a8fffb8ed7d13e3a323517866934a')

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

