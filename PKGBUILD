# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=panicparse
pkgver=1.4.1
pkgrel=1
pkgdesc="Crash your app in style (Golang)"
arch=('x86_64')
url='https://github.com/maruel/panicparse'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6ee08d35912c570dad33761a55b384afda3d0dbbe45a49fcb213df61d036555c')

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
  install -Dm755 build/panicparse "${pkgdir}/usr/bin/panicparse"
}