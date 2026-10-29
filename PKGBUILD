# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=2.7.0
pkgrel=2
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
b2sums=('d45d37ab270d203415c4b4b5c7a0927f712bb1ba4bbd9064c51df198f991fb64da79726d5d35b1250b0a6e15b74505ecfa08649edb65ed83838bcc096cb34f12')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
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
  install -Dm755 cmd/naabu/naabu ${pkgdir}/usr/bin/naabu
}
