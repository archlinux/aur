# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.4.0
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

makedepends=("go")

conflicts=('natscli-bin' 'natscli-git')
provides=('nats')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('6dc9056aa439f90de2a705983005363ae05f1f9985b81881cbfffa867a344ef6')

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
