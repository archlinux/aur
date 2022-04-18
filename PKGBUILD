# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.32
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('4c1c56109958ce0fe467ad783aa31fa6bba30f52bc45f71a1475c4edcf03e383')

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
