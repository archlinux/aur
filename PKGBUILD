# Maintainer: Hao Long <imlonghao@archlinuxcn.org>

pkgname=statik
pkgver=0.1.7
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
b2sums=('0fc7f0476b98ce25d2ad5fbfe1127ef5d0bd85007c77ed933853a6ac9d3dc10f989489a58e7def2cd01df6528294bf47273aaa4f6c0ac4cbcdf182f263f5a555')

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
