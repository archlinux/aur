# Maintainer: BigmenPixel <bigmen dot pixel at tuta dot io>

pkgname=tun2socks
pkgver=2.4.0
pkgrel=1
pkgdesc="tun2socks - powered by gVisor TCP/IP stack"
arch=('any')
url="https://github.com/xjasonlyu/tun2socks"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
makedepends=("go")
sha256sums=('4a357076bbc98db52aa94ea32d8b32cbfed4f24385b0ad0c2fe771811007f41d')

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
