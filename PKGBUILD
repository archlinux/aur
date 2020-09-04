# Maintainer: Hao Long <aur@esd.cc>

pkgname=ksubdomain
pkgver=0.4
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64" "i686")
url="https://github.com/knownsec/ksubdomain"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4993dc41e7324f74515d1336413390fa66d1e6b45c73f8b29a275bbd01edcbd7')

build() {
  cd ${pkgname}-${pkgver}/cmd
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  # export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  go build -o ../${pkgname} .
}

package() {
  cd ${pkgname}-${pkgver}
  # install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

