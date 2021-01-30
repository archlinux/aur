# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=v0.3.0
pkgrel=1
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('x86_64' 'armv7h')
url=https://git.cryptic.systems/volker.raschek/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("https://git.cryptic.systems/volker.raschek/flucky/archive/${pkgver}.tar.gz")
sha512sums=('e2e689e757b82cc3584fbb68d018d6179c4395d25b2abdb82eb9ef240531dc4e3a417c6649085ced47ea343c7c989211653ca6e1a7007b417cd07984697cb5c4')

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
