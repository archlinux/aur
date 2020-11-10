# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=siggo
pkgver=0.7.0
pkgrel=1
pkgdesc='A terminal gui for signal-cli, written in Go.'
arch=('x86_64')
url='https://github.com/derricw/siggo'
license=('GPL3')
depends=('libmatthew-unix-java' 'signal-cli')
makedepends=('go')
source=("https://github.com/derricw/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('55d080d899cae180c2f11b9c752dc44de7aa2300a18f14abc2c8023941496c87ab7e63127f33c98ac8309ac70e346535b182aa52ea704ce93bf94c20974a20d3')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -Dm755 -t "${pkgdir}"/usr/bin/ "${srcdir}"/${pkgname}-${pkgver}/siggo
}
