# Maintainer: Hao Long <aur@esd.cc>

pkgname=httpx
pkgver=1.2.5
pkgrel=1
pkgdesc="A fast and multi-purpose HTTP toolkit allow to run multiple probers using retryablehttp library"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/httpx"
license=("MIT")
provides=('httpx')
conflicts=('httpx')
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('6804cefc6a7d3d9e84e1d3846e7ce2ff5ae099a410ad4921bec41fb157dadaf2d2499a91ea81fd4264998b2fae6282b2a53cbdd0cd94f0a74109e9f4926a49fb')

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
  install -Dm755 cmd/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
