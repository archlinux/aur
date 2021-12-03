# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.27
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin')
provides=('nats')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('049d3eb29af7e2ef3ba92e540ce6ce7f25d562b12bd2a7e89ddf19bff3b40079')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/nats"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/nats"
	install -D -m755 nats ${pkgdir}/usr/bin/nats
}
