# Maintainer: Sematre <sematre at gmx dot de>
pkgname=rm2pdf
pkgver=0.1.7
pkgrel=1

pkgdesc="Convert reMarkable tablet notebooks and annotated PDFs to layered PDF documents."
url="https://github.com/rorycl/${pkgname}"
license=('MIT')
arch=('any')

makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e7f26422b507219aa60e90f9441e62b8ff72826d4aa464e3e7f4342f4ac3a45')

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
