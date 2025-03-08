# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=gomodifytags
pkgver=1.17.0
pkgrel=1
pkgdesc="Go tool to modify struct field tags"
arch=('x86_64')
url="https://github.com/fatih/gomodifytags"
license=('BSD-3-Clause')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ac0432a044582b90b6df7fdd1a47ccd5e2d1737dfbe9fdb786eedc069d0b62b2751244fb03e0b343927c409b3f2d9bf88edfd714ab811599e0bb6a65563fbf70')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
