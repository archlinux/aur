# Maintainer: Hao Long <aur@esd.cc>

pkgname=chisel-tunnel
pkgver=1.10.1
pkgrel=1
pkgdesc="A fast TCP/UDP tunnel over HTTP"
arch=("x86_64" "i686")
url="https://github.com/jpillora/chisel"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('e215cbcb6b825a1e54d3901eaf3dc524d9f15fc724c6c6b179644e3cfd4456e085a5486e45d392dc4656b8b3d36f84c66456846550d49b6b0c3a7564a32cae3f')

build() {
  cd chisel-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildmode=pie -trimpath -ldflags "-linkmode=external -X github.com/jpillora/chisel/share.BuildVersion=${pkgver}" -mod=readonly -modcacherw .
}

package() {
  cd chisel-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 chisel ${pkgdir}/usr/bin/chisel
}
