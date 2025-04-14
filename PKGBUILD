# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.2.2
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin' 'natscli-git')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('493f71a5fee6c4cae707c4d7b767168d4f563c4ddc463381f55ab1d58f025fbf')

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
