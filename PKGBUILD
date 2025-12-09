# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Jeff Henson <jeff@henson.io>

pkgname=jqp
pkgver=0.8.0
pkgrel=1
pkgdesc="A TUI playground to experiment with jq"
arch=('x86_64' 'i686')
url="https://github.com/noahgorstein/jqp"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c70e83975edb1c1dacb0fb067a0685e9632e21360805ade3dda03e54751e4855')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o ${pkgname}
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm 755 ${pkgname} -t "${pkgdir}/usr/bin/"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
