# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gotz
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI timezone info"
arch=(x86_64)
url="https://github.com/merschformann/gotz"
license=('MIT')

makedepends=("go")

conflicts=('gotz-bin')
provides=('gotz')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('9c3cdd70fd1c1f7f33bdf64fff7352d77d2ccd19475e9293ef2beb83969696e2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/gotz"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/gotz"
	install -D -m755 gotz ${pkgdir}/usr/bin/gotz
}
