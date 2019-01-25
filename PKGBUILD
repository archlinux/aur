# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=reg
pkgver=0.15.0
pkgrel=1
pkgdesc="Docker registry v2 command line client and repo listing generator with security checks"
arch=('i686' 'x86_64')
url="https://github.com/genuinetools/$pkgname"
license=('MIT')
makedepends=(
	'go'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('099d33931d8606c179d40fb8cd27f1990fc55bd245e0c25c6abbab3dcad7391c9b1f4b5ccfbe45b88f6bc68cfca4e1dbb545b70bccf8446ffa3ec9d02177f914')

build() {
	mkdir -p "${srcdir}/go/src/github.com/genuinetools"
	ln -sf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/go/src/github.com/genuinetools/${pkgname}"
	cd "${srcdir}/go/src/github.com/genuinetools/${pkgname}"
	GOPATH="${srcdir}/go" make install
}

package() {
	install -Dm755 "${srcdir}/go/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
