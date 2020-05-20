# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gocity
pkgver=1.0.0
pkgrel=2
pkgdesc="Code City metaphor for visualizing Go source code in 3D"
arch=('x86_64')
url='https://go-city.github.io'
license=('MIT')
provides=('gocity')
depends=('glibc')
makedepends=('go')
source=("gocity-${pkgver}.tar.gz::https://github.com/rodrigo-brito/gocity/archive/v${pkgver}.tar.gz")
sha256sums=('dfe6cc9b7845f47d4850b1d30fe5246a40e2635d71824a29dbb13bffce2d40a2')

prepare() {
  cd "${srcdir}/gocity-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/gocity-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/gocity-${pkgver}"
  install -Dm755 build/gocity "${pkgdir}/usr/bin/gocity"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gocity/LICENSE"
}