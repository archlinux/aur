# Maintainer: Hao Long <aur@esd.cc>

pkgname=ksubdomain
pkgver=0.6
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64" "i686")
url="https://github.com/knownsec/ksubdomain"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bdeb5c21c36773487d462d2335b9e29466a6d0be7428f97315a8d34fc1684262')

build() {
  cd ${pkgname}-${pkgver}/cmd
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ../${pkgname} .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
