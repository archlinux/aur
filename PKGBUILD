# Maintainer: Hao Long <aur@esd.cc>

pkgname=chisel-tunnel
pkgver=1.11.4
pkgrel=1
pkgdesc="A fast TCP/UDP tunnel over HTTP"
arch=("x86_64" "i686")
url="https://github.com/jpillora/chisel"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('c2d31aff92c810e68c4b8b9f48fc7a6abe93795158d0d44f8c792a4bb4457d5f04a94faf3bcc844ef978b02c49ae881d4ff9fde1feeaff6c9dcb4987914fbf69')

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
