# Maintainer: Jan Sonntag <jaso35 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=asciigraph
pkgver=0.5.5
pkgrel=1
pkgdesc="Go package to make lightweight ASCII line graph ╭┈╯ in command line apps with no other dependencies"
arch=('x86_64')
url='https://github.com/guptarohit/asciigraph'
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/guptarohit/asciigraph/archive/v${pkgver}.tar.gz")
sha256sums=('4c57ffdd5b13a2e4a6aa6ec6977651776a01b640402c43c7c4fa6c9c38dd160f')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/asciigraph "${pkgdir}/usr/bin/asciigraph"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/asciigraph/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/asciigraph/README.md"
}
