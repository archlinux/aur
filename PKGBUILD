# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=envrun
pkgver=0.6.0
pkgrel=2
pkgdesc="Helper utility to inject environment variables stored in a file into processes"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a2b854abba9cb7e8078d0c8f662d93ba32e87fbac73becbb1de0c0ffd27603a184ccd9b7b6a93a12b55b32967a0a2884bf1739f97cb797e1a372ae9c4d7bc85b')

build() {
	mkdir -p "${srcdir}/go/src/github.com/Luzifer"
	ln -sf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/go/src/github.com/Luzifer/${pkgname}"
	GOPATH="${srcdir}/go" go install -a -v -ldflags="-X main.version=${pkgver}" "github.com/Luzifer/${pkgname}"
}

package() {
	install -Dm755 "${srcdir}/go/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
