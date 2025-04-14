# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai
_pkgname=fabric
pkgver=1.4.170
pkgrel=1
pkgdesc="open-source framework for augmenting humans using AI"
arch=('x86_64' 'aarch64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('df8d5cb4217cd3589a14f05075d01327113b302e1f5b3b36de463beb8570dabe')


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
