# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=2.3.0
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
b2sums=('376278abd7b97726956ff4fec16fe9654fa076f8610c10d40b49e3132e634daca0251c6d4872e6d50824916461a042891eea983098a378533aed0a5a11fe567c')

build() {
  cd ${pkgname}-${pkgver}/v2/cmd/${pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -Dm755 v2/cmd/naabu/naabu ${pkgdir}/usr/bin/naabu
}
