# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=multi-gitter
pkgver=0.63.1
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('de3a8a792844d2d3901ca845b30c291bd3ab6c845a9709072b3715569f3de4e50055fb3d018402b963be3b003eec516859623ceaea406764633c75a5136ea6e9')
license=('Apache-2.0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE="on"

  go build -o "${srcdir}/bin/multi-gitter"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/bin" || exit
  install -Dm 755 'multi-gitter' "${pkgdir}/usr/bin/multi-gitter"
}
