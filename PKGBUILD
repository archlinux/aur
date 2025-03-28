# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai
_pkgname=fabric
pkgver=1.4.165
pkgrel=1
pkgdesc="open-source framework for augmenting humans using AI"
arch=('x86_64' 'aarch64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('142ae04f1e58467ee5a8af366a5b0264c4de0c1ac53d4ffa1bdb8c116ec3daed')


build() {
  cd "${_pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -v
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 fabric "${pkgdir}/usr/bin/fabric-ai"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
