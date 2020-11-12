# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=siggo
pkgver=0.8.1
pkgrel=1
pkgdesc='A terminal gui for signal-cli, written in Go.'
arch=('x86_64')
url='https://github.com/derricw/siggo'
license=('GPL3')
depends=('libmatthew-unix-java' 'signal-cli')
makedepends=('go')
source=("https://github.com/derricw/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('61f456fdeced92de2930c3978e1b72dab856fe14128196ebeb8bdb5fb3e3876615c97c6055241c161d503eb8a29b5d5687a134cfcf0a8dbeda056f182fa7fb83')

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
