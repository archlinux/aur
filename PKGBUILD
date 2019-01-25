# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=reg
pkgver=0.16.0
pkgrel=1
pkgdesc="Docker registry v2 command line client and repo listing generator with security checks"
arch=('i686' 'x86_64')
url="https://github.com/genuinetools/$pkgname"
license=('MIT')
makedepends=(
	'go'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('1e4d936e406998ffaa176e7834b28970b594f88a339fd8447bef2f944efa9b51c1d35bf71b384b3ed1b3e84be08db6d7fd487f4a3c65aa2de0308d6128cf0070')

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
