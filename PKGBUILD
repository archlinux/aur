# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=v0.2.0
pkgrel=1
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('any')
url=https://git.cryptic.systems/volker.raschek/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("https://git.cryptic.systems/volker.raschek/flucky/archive/${pkgver}.tar.gz")
sha512sums=('33b5551804ce2a4c0c62bf15287a2b4c2365bd15b4fd8d90e83d22e073f2ab4959e664e9a59c7f43b0243dd627a0b34741fc87a7a5fe4657a340a82c413787cb')

build() {
  GOBIN=${HOME}/go/bin
  PATH=${GOBIN}:${PATH}
  go get -u github.com/go-bindata/go-bindata/...
  make --directory "${srcdir}/${pkgname}" bin/tmp/${pkgname} VERSION=${pkgver}
}

package() {
  install -D --mode 4755 "${srcdir}/${pkgname}/bin/tmp/${pkgname}" "${pkgdir}/usr/bin/flucky"
  install -D --mode 644 "${srcdir}/${pkgname}/systemd/flucky.service" "${pkgdir}/usr/lib/system/systemd/flucky.service"
  install -D --mode 644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}