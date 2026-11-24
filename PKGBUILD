# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=go-bindata
pkgver=4.0.3
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/kevinburke/go-bindata'
license=('custom:CC0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e6a8a65231603e841741cc0cddeac38311315ab8435193853dda3d45a3e7476fa6a1bb5deb8ea62eb95dc0ab04366db000fb3d50e09ffb0a064c0b289b344d81')

prepare(){
  cd "${pkgname}-${pkgver}"

  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./go-bindata
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
