# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.5.2
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin' 'natscli-git')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('6a735b879a19a7abaa4b45e512f23ddb7df6e8f1cd14b32091cd8568e4e94f63')

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
