# Maintainer: Hao Long <aur@esd.cc>

pkgname=ksubdomain
pkgver=2.4.0
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64" "i686")
url="https://github.com/boy-hack/ksubdomain"
license=("MIT")
depends=("libpcap" "glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('7d67de991a64b52b16de2bec9d55659ee867863c0e721fc342ca2a56fb5607d4527c9a30b4295350e89d4aa757b5f62eb5c2d34b01357b5cf4fdd0eddc86e946')

build() {
  cd ${pkgname}-${pkgver}/cmd/ksubdomain
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ../../${pkgname} .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
