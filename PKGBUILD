# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.28
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('2be99c70eeabed5510a8c28dbf443b04e503a54536374d543a4c8c8756831a2c')

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
