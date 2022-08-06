# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=2.1.0
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
b2sums=('0cf3a0514cbfa13f36349676046af580e2bf3ccf5c67330e2a88674f6cde63baf529e761b6f30afdcf179b729142053b1bcb85ecf8ea1ca149c532565fb11093')

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
