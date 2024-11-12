# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=2.3.2
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
b2sums=('fa37dd04259e86ecab045f080249cdc6e82e9fdeeb41fc3b63bf6fe39ab07757d9a061b1e07b4cb18c51eb01f0d6fd4a3e14ac3401533e076d9661ece83bb187')

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
