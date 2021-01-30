# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=0.3.1
pkgrel=2
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('x86_64' 'armv7h')
url=https://git.cryptic.systems/volker.raschek/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("https://git.cryptic.systems/volker.raschek/flucky/archive/v${pkgver}.tar.gz")
sha512sums=('249ae31211156b2f7dd70f59d2c0c6c1762906e7d897cba4142567eb477cf7adc3076ee8c4a6500c077b9df63d9628e5763b014e523b5bccc7f6939ead299b1b')

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
