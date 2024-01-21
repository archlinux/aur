# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=2.2.1
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
b2sums=('668a644bb62aed2af81f2ea9fbd724299ab8f8c82454b20583afc35d5ff95b3811df0bb26ff1ea68244c310095f99855ad3ac692268122235f08c36fac046119')

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
