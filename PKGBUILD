# Maintainer: Hao Long <imlonghao@archlinuxcn.org>

pkgname=statik
pkgver=0.1.8
pkgrel=1
pkgdesc="Embed files into a Go executable"
arch=("x86_64" "i686")
url="https://github.com/rakyll/statik"
license=("Apache")
depends=("glibc")
makedepends=("go")
provides=('statik')
conflicts=('statik')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('4e3e3364c4130f701f71898ffa947907526bae8f641299df8fd6a73073e1b58def97f51f0d0b99074a04d2354d0e3a5a1af6ebdaa9a4e17aa6a4087fa74f393e')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
