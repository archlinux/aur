# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-motion
pkgver=1.1.0
pkgrel=1
pkgdesc="Tool providing contextual information for go source files."
arch=('any')
url="https://github.com/fatih/${pkgname#go-}"
license=('BSD')
conflicts=('motion')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('1c3965cb524b708ba963ff52e22ebf5f2daf90b1f8a98acf376aecae6c146325fac0b61bae35eb83f4ba5a5da863e10802f146805d877a2fe5e479f56045b403')

build() {
	cd "${pkgname#go-}-${pkgver}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		.
}

package() {
	cd "${pkgname#go-}-${pkgver}"
	install -Dm755 ${pkgname#go-} -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname#go-}"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname#go-}"
}
