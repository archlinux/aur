# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai
_pkgname=fabric
pkgver=1.4.164
pkgrel=1
pkgdesc="open-source framework for augmenting humans using AI"
arch=('x86_64' 'aarch64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('481718a599663fe5d4ea00aea6e53c81f64183a1c551535573d8faf9b8f3bb67')


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
