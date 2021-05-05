# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=siggo
pkgver=0.9.1
pkgrel=1
pkgdesc='A terminal gui for signal-cli, written in Go.'
arch=('x86_64')
url='https://github.com/derricw/siggo'
license=('GPL3')
depends=('libmatthew-unix-java' 'signal-cli')
makedepends=('go')
source=("https://github.com/derricw/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('6d30460bb816ef737c39f6b86fc03bbb4ed23a992fca198cb3d27b5b989c392bad65cb9811080c6528022cf0c2290afd20a957242c3b5d07cc1060c68e2ffd85')

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
