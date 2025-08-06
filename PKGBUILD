# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai
_pkgname=Fabric
pkgver=1.4.273
pkgrel=1
pkgdesc="open-source framework for augmenting humans using AI"
arch=('x86_64' 'aarch64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f3dac2f1be1b6135ce0464f328e54c6d3dd5556d1bacaeb28c75589f12fd3fd2')


build() {
  cd "${_pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -v ./cmd/fabric
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 fabric "${pkgdir}/usr/bin/fabric-ai"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
