# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=multi-gitter
pkgver=0.63.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('f96fb4e33e1f20b13c99969ee84709783a555d44f3222a52fb37f8e1d7c469492c7b79bb57efc6bcf65aea486f54f918dd283f8e6d4d7840a41b54c42e4b0c33')
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
