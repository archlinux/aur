# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gotz
pkgver=0.1.14
pkgrel=1
pkgdesc="CLI timezone info"
arch=(x86_64)
url="https://github.com/merschformann/gotz"
license=('MIT')

makedepends=("go")

conflicts=('gotz-bin')
provides=('gotz')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('44258a08762fda0f0f6eb5afe4eefc8256539da1a8215f77048c1c6f0f0070e5')

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
