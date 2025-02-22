# Maintainer: Hao Long <aur@esd.cc>

pkgname=ksubdomain
pkgver=1.9.9
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64" "i686")
url="https://github.com/boy-hack/ksubdomain"
license=("MIT")
depends=("libpcap" "glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('bdc047ba34739666ed5247dc5fa90b12babb45b60122be5affe8ed787afbf519e211ec900407b0818327e8c83101c9feaae239b54fb258dad5a2247138ff227e')

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
