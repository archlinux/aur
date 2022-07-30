# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gotz
pkgver=0.1.6
pkgrel=1
pkgdesc="CLI timezone info"
arch=(x86_64)
url="https://github.com/merschformann/gotz"
license=('MIT')

makedepends=("go")

conflicts=('gotz-bin')
provides=('gotz')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('69d3c0e92687e5e851ca6254ad2da038b80b3fb5a2a17d7b4791233500d68205')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 gotz ${pkgdir}/usr/bin/gotz
}
