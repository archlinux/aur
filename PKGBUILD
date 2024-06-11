# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=kpcli-go
_pkgname=kpcli
pkgver=1.0.32
pkgrel=1
pkgdesc="create, list and diff entries between keepass databases"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/robertranjan/kpcli"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4b6a9e26625074931c94a948858f15c5aa6d347e1e3f8a2a2a54f575afad2887')


build() {
  cd "${_pkgname}-${pkgver}"

  # Set proper version
  sed -e "s:^\(var Version string = \).*:\1\"${pkgver}\":" \
      -i "version/version.go"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-trimpath'
  go build -v
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 kpcli "${pkgdir}/usr/bin/kpcli-go"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
