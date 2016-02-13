# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=peco
pkgver=0.3.5
pkgrel=1
pkgdesc='Simplistic interactive filtering tool'
arch=('x86_64' 'i686')
url='https://github.com/peco/peco'
license=('MIT')
makedepends=('go' 'git' )
depends=('glibc')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('416d2547b639b11563d0bd910fa043e532f25fcc40de3ec0d7bec4943747fff1')

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

