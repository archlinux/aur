# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.3.1
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin' 'natscli-git')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('d543d31802276d185b01248bb08892840f84ab055d68e18c240314e224220456')

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
