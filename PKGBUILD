# Maintainer: Hao Long <aur@esd.cc>

pkgname=platypus
pkgver=1.2.7
pkgrel=2
pkgdesc="A modern multiple reverse shell sessions manager written in go"
arch=("x86_64" "i686")
url="https://github.com/WangYihang/Platypus"
license=("LGPL3")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8fb747dc06889d8cdb7a7612ee95d1a86825b7e4bc109cdcbb9df9530055b6af')

build() {
  cd Platypus-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd Platypus-${pkgver}
  install -Dm755 Platypus ${pkgdir}/usr/bin/${pkgname}
}
