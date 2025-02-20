# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=go-motion
pkgver=1.2.0
pkgrel=1
pkgdesc="Tool providing contextual information for go source files."
arch=('x86_64')
url="https://github.com/fatih/motion"
license=('BSD-3-Clause')
conflicts=('motion')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f674084c32d2d9f727ef3642a2da29f577d36f80243cd03bf3cf9463a6d72652dcbfbbf8b05e31d4a85f02be016f24bb90fe892ade10a085a52f1be6f4374318')

build() {
	cd "${pkgname#go-}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build .
}

package() {
	cd "${pkgname#go-}-${pkgver}"
	install -Dm755 ${pkgname#go-} -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
