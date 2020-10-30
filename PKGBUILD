# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mole
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64')
url='https://davrodpin.github.io/mole'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davrodpin/mole/archive/v${pkgver}.tar.gz")
sha256sums=('ef835962447709c391ba2322249982e400906285a65f145776b4742dc224d821')

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
  install -Dm755 build/mole "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
