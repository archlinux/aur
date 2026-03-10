# Maintainer: Hao Long <aur@esd.cc>

pkgname=chisel-tunnel
pkgver=1.11.5
pkgrel=1
pkgdesc="A fast TCP/UDP tunnel over HTTP"
arch=("x86_64" "i686")
url="https://github.com/jpillora/chisel"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('30ff65f4b4258101d4d3479d089ad7f915016c34d8614fddd095eb0771bd7582406e35211bbe06a5d1fdf134bb4f2e2c6c11e0d0e9fa2500d7a92de90288cd0f')

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
