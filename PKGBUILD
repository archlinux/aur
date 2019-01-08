# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=mkcert
_package="github.com/FiloSottile/${pkgname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple tool for making locally-trusted development certificates"
arch=('x86_64')
url="https://github.com/FiloSottile/mkcert"
license=('BSD')
makedepends=('go' 'git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/FiloSottile/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('5889775924122e196235ced42434c8c58d101188b725154a3424d1c8a4d10d14')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  export GOPATH="${srcdir}"
  install -d "${GOPATH}/src/github.com/FiloSottile"
  ln -sf "$PWD" "${GOPATH}/src/${_package}"
}

build() {
  export GOPATH="${srcdir}"
  cd "${GOPATH}/src/${_package}"
  go build -asmflags "-trimpath $GOPATH/src" -gcflags "-trimpath $GOPATH/src"
}

package() {
  export GOPATH="${srcdir}"
  cd "${GOPATH}/src/${_package}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
