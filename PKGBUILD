pkgname=multi-gitter
pkgver=0.60.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('ac9395c11252b531e92a8d8a6db05d31b9b72b92530b9f011964bb5c7ca8aeee81caaf80b4649f6db5a1c175f592e633720ad2f840991267c9d965346b2eca26')
license=('Apache-2.0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE="on"

  go build -o "${srcdir}/bin/multi-gitter"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/bin"
  install -Dm 755 'multi-gitter' "${pkgdir}/usr/bin/multi-gitter"
}
