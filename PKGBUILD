# Maintainer: BigmenPixel <bigmen dot pixel at tuta dot io>

pkgname=tun2socks
pkgver=2.3.2
pkgrel=2
pkgdesc="tun2socks - powered by gVisor TCP/IP stack"
arch=('any')
url="https://github.com/xjasonlyu/tun2socks"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
makedepends=("go")
sha256sums=('87200130076b5a5cc5184f4b1b353c4bbeb36f9fca69208e0b62adcf73ec7afc')

prepare() {
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
  go build -o build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
