# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gopium
pkgver=1.1.0
pkgrel=1
pkgdesc="Smart Go Structures Optimizer and Manager"
arch=('x86_64')
url='https://github.com/1pkg/gopium'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ccd66eac9be284ae91ff898a85338114678e2a65ac4180faf26af72d52ee858c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/gopium"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o "${srcdir}/${pkgname}-${pkgver}"/build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/gopium "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}