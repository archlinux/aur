# Maintainer: Hao Long <aur@esd.cc>

pkgname=httpx
pkgver=1.3.5
pkgrel=1
pkgdesc="A fast and multi-purpose HTTP toolkit allow to run multiple probers using retryablehttp library"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/httpx"
license=("MIT")
provides=('httpx')
conflicts=('httpx' 'python-httpx')
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('4b7f299d291f9c5417ec815bd2e88d6e5f99b6ffc3a1dfde452ffa02b224ae66e75b7821c12b596097de5bde77764448d96b6834d7f4fc931a27d30000f73476')

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
  install -Dm755 cmd/${pkgname}/${pkgname} ${pkgdir}/usr/bin/httpx-toolkit
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
