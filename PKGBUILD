# Maintainer: Hao Long <aur@esd.cc>

pkgname=ksubdomain
pkgver=2.1
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64" "i686")
url="https://github.com/boy-hack/ksubdomain"
license=("MIT")
depends=("libpcap" "glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('6ab16aacdbc88ac9b95f270416d795785d32e2985b54317d411233d97f734d335e69ff7ee35d4f6b8e645a6d1e15948fa90b4dabf34ea7d2a356fee68219f7c4')

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
