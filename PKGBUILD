# Maintainer: Sematre <sematre at gmx dot de>
pkgname=rm2pdf
pkgver=0.1.5
pkgrel=1

pkgdesc="Convert reMarkable tablet notebooks and annotated PDFs to layered PDF documents."
url="https://github.com/rorycl/${pkgname}"
license=('MIT')
arch=('any')

makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6bacd90fa71630b9683df6a32ece19124a0b49ba072f5d63712952e81b1ef17a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "LICENCE"    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
