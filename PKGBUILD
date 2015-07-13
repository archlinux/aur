# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=peco
pkgver=0.3.3
pkgrel=1
pkgdesc='Simplistic interactive filtering tool'
arch=('x86_64' 'i686')
url='https://github.com/peco/peco'
license=('MIT')
makedepends=('go' 'git' )
depends=('glibc')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3d30a8788c2c7cf4ac44bc5ad09415b9b6245c6e842e46b4e234cb844e929c84')

prepare() {
  export GOPATH="$srcdir"
  go get github.com/${pkgname}/${pkgname}
}

build() {
  cd "${pkgname}-${pkgver}/cmd/${pkgname}"

  GOPATH="$srcdir" go build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "./cmd/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

