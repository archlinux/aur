# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=legume
pkgver=1.3.3
pkgrel=1
pkgdesc="A minimalist, distributed, database-free issue tracker using traditional TODO/FIXME code comments."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/legume"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main._version=v${pkgver} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/leg
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-v${pkgver}/leg "${pkgdir}"/usr/bin/legume
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('1fb741cb846bc82f3831cff8d1deae1ce33035a5808326d8f3a703d8bab9f69f')
