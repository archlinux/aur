# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=chaos
pkgname="${_pkgname}-client"
pkgver=0.1.6
pkgrel=1
pkgdesc='Client to communicate with Chaos DNS API'
arch=('x86_64')
url='https://github.com/projectdiscovery/chaos-client'
license=('MIT')
makedepends=('go')
provides=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6d8a848c015a39dd7258eab429d263d3c3ab0dff7a705418f3c18e9a90ea689b')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  cd "${pkgname}-${pkgver}"
  go build -v -o "${_pkgname}" ."/cmd/${_pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
