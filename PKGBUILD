# Maintainer: Hao Long <aur@esd.cc>

pkgname=chisel-tunnel
pkgver=1.10.0
pkgrel=1
pkgdesc="A fast TCP/UDP tunnel over HTTP"
arch=("x86_64" "i686")
url="https://github.com/jpillora/chisel"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2e0a291540f4e33071685408d2877d084f5dbb050ff6036c996ff04b385e136e4290512d0bcf4963e669330c035cc28406b048924e24483868e34090c7f37adf')

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
