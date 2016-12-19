# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pget
pkgver=0.0.6
pkgrel=1
pkgdesc="Parallel file download client"
arch=('i686' 'x86_64')
url="https://github.com/Code-Hex/${pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Code-Hex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4ddbfc0e7e041e2a459aa02ea28b6c9d358a30581a588201295cfb355d526c99')

prepare() {
  mkdir -p "${srcdir}/src/github.com/Code-Hex/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/Code-Hex/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/Code-Hex/${pkgname}"
  export GOPATH="${srcdir}"
  go get -d ./cmd/${pkgname}
  go build ./cmd/${pkgname}
}

package() {
  cd "${srcdir}/src/github.com/Code-Hex/${pkgname}"
  install -Dm755 pget "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sts=2 sw=2 et:
