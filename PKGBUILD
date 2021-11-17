# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Andy Nicholson <andrew@anicholson.net>
# Contributors: teutat3s

pkgname=k6
pkgver=0.35.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript"
arch=('x86_64' 'i686')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('52d81754f2d4e23f180eb094b0a203c9162dda177a23b8aa3b96bd84981a31a7')

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
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
