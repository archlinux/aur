# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.5.0
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin' 'natscli-git')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/nats"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
    .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/nats"
  install -D -m755 nats ${pkgdir}/usr/bin/nats
}
