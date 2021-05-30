# Maintainer: Hao Long <aur@esd.cc>

pkgname=httpx
pkgver=1.0.8
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
sha256sums=('38b600934ea0dbe31b23c5e1a13f3c201f6392f38bf46ce02f94a2b55d824c5e')

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
