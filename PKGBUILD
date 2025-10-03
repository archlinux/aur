# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gotz
pkgver=0.1.15
pkgrel=1
pkgdesc="CLI timezone info"
arch=(x86_64)
url="https://github.com/merschformann/gotz"
license=('MIT')

makedepends=("go")

conflicts=('gotz-bin')
provides=('gotz')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('8ab6167d9a98717a8548ff60b0f454c42f116e94216e3a5d83deb711c035b270')

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
