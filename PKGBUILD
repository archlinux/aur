# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pget
pkgver=0.0.5
pkgrel=1
pkgdesc="Parallel file download client"
arch=('i686' 'x86_64')
url="https://github.com/Code-Hex/${pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Code-Hex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('665f79845c3bdc9bc97736da81946f11e46be82663e2712bba7fea8186095096')

prepare() {
  mkdir -p "${srcdir}/src/github.com/Code-Hex/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/Code-Hex/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/Code-Hex/${pkgname}"
  GOPATH="${srcdir}"
  go get -d ./cmd/${pkgname}
  go build ./cmd/${pkgname}
}

package() {
  cd "${srcdir}/src/github.com/Code-Hex/${pkgname}"
  install -Dm755 pget "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sts=2 sw=2 et:
