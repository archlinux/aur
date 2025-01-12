# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gotz
pkgver=0.1.10
pkgrel=1
pkgdesc="CLI timezone info"
arch=(x86_64)
url="https://github.com/merschformann/gotz"
license=('MIT')

makedepends=("go")

conflicts=('gotz-bin')
provides=('gotz')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('adb6335f5691f9a99c96c0a7b17fb81a9dd35253127116b4f08a19be156ba26e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 gotz ${pkgdir}/usr/bin/gotz
}
