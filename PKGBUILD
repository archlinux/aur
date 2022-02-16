# Maintainer: Hao Long <aur@esd.cc>

pkgname=chisel-tunnel
pkgver=1.7.7
pkgrel=1
pkgdesc="A fast TCP/UDP tunnel over HTTP"
arch=("x86_64" "i686")
url="https://github.com/jpillora/chisel"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('7975743f795bb852998de20fc3031b07d72f1987917600616462aecc805e6a25aad878ba2d801b0e0322e301f4adab951a193d9604e80cf560efc27315b38d65')

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
