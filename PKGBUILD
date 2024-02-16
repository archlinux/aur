# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.1.3
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin' 'natscli-git')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('53e42beca25a7dec978b4e87bed8a1eac025ef4a0bd0542e9a9cf042e4bcf9c2')

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
