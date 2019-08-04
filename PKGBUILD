# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=envrun
pkgver=0.6.1
pkgrel=1
pkgdesc="Helper utility to inject environment variables stored in a file into processes"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('21c9225ecd829f91f57bba2121f347bd287c37b78d8927b86b9d1b8aef41841d846ba3dee0d254b4994237e085b33e69c9060ca1dbb731c816840ed7a5fbe18d')

build() {
	export GO111MODULE=on
	export GOPATH="${srcdir}/go"

	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -a -v \
		-ldflags="-X main.version=${pkgver}" \
		-mod=readonly \
		-o "${srcdir}/${pkgname}"

	go clean -modcache
}

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
