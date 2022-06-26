# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=container-logs
pkgver=0.1.0
pkgrel=2
pkgdesc='Print logs of docker containers on stdout'
arch=('x86_64' 'armv7h')
url=https://git.cryptic.systems/volker.raschek/container-logs
license=('Apache 2.0')
depends=('docker')
makedepends=('git' 'go')
source=(
  "https://git.cryptic.systems/volker.raschek/container-logs/archive/v${pkgver}.tar.gz"
)
sha512sums=('a58945d67f58da882e4a00b122e217997f08e5fcbb0f2c555a1ccd16eb77df25fafcd65e23f001930acf45306d474791d0f4ced79d26f2cc0e4f2fdd87007cc6')

build() {
  GOBIN=${HOME}/go/bin
  PATH=${GOBIN}:${PATH}
  make --directory ${srcdir}/container-logs bin/tmp/container-logs VERSION=${pkgver}
}

package() {
  install -D --mode 4755 ${srcdir}/container-logs/bin/tmp/container-logs ${pkgdir}/usr/bin/container-logs
  install -D --mode 644  ${srcdir}/container-logs/LICENSE ${pkgdir}/usr/share/licenses/container-logs/LICENSE
}
