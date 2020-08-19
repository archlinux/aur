# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=v0.2.1
pkgrel=1
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('any')
url=https://git.cryptic.systems/volker.raschek/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("https://git.cryptic.systems/volker.raschek/flucky/archive/${pkgver}.tar.gz")
sha512sums=('160e3cba23ebd16305f4d9ddfc53aaad86a76d7830113e3d0b988850d42caa3b947aa38e5444b980ac814a726f99b2b5b48289636d5ec903d085dbba5ba07075')

build() {
  GOBIN=${HOME}/go/bin
  PATH=${GOBIN}:${PATH}
  go get -u github.com/go-bindata/go-bindata/...
  make --directory ${srcdir}/${pkgname} bin/tmp/${pkgname} VERSION=${pkgver}
}

package() {
  install -D --mode 4755 ${srcdir}/${pkgname}/bin/tmp/${pkgname} ${pkgdir}/usr/bin/flucky
  install -D --mode 644  ${srcdir}/${pkgname}/systemd/flucky.service ${pkgdir}/usr/lib/systemd/system/flucky.service
  install -D --mode 644  ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}