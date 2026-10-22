# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=multi-gitter
pkgver=0.64.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('16675d1e19f86452e4a4a610d0b97e9681a8698b896feaab82ba6f63c7a21df9b08710df129dcfb2efcd6614f0279d673d430ddcdf75425395fe86e326bb564a')
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
