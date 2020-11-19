# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c2go
pkgver=0.26.7
pkgrel=1
pkgdesc="A tool for transpiling C to Go"
arch=('x86_64')
url='https://github.com/elliotchance/c2go'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d2b6f2aaaad6be12646d5675fab954d2a35df3f65910d80a04348be33020be73')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/c2go "${pkgdir}/usr/bin/c2go"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/c2go/LICENSE"
}
