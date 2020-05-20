# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=moldova
pkgver=2.0.1
pkgrel=1
pkgdesc="A lightweight templating system for generating random data"
arch=('x86_64')
url='https://github.com/StabbyCutyou/moldova'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('099f417c638164386760d612426d13329b657531b3d4c9b3dab7f24381e35ebc')

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
  go get -d -v ./cmd/...
  go build -o build ./cmd/...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/moldova "${pkgdir}/usr/bin/${pkgname}"
}