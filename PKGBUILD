pkgname=sip-ping
pkgver=2.0.0
pkgrel=1
pkgdesc='Send a SIP OPTIONS request to a server over ws/wss or udp/tcp/tls.'
arch=('x86_64')
url="https://github.com/lwahlmeier/$pkgname"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f707e2d417480068faf032aba4d0b74b308d304b6d1990b1ecf32adc81ce45c1')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
