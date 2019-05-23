# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgver_openzwafe=1.5
pkgname=gateway
pkgver=0.7.0
pkgrel=1
pkgdesc="Things Gateway by Mozilla"
arch=(any)
url="https://iot.mozilla.org/gateway/"
license=(MPL2)
depends=('libusb' 'nodejs' 'openzwave')
optdepends=()
makedepends=('git' 'yarn' 'nodejs-lts-carbon')
source=(gateway.service
        git+https://github.com/mozilla-iot/gateway.git#tag=${pkgver}
        git+https://github.com/OpenZWave/open-zwave.git#tag=V${_pkgver_openzwafe})
sha1sums=('b3cc211e2725bc4ec80037d413c86563092b3a25'
          'SKIP'
          'SKIP')

prepare() {
  mkdir -p bin
  ln -fs /usr/bin/node bin/nodejs
  export PATH=$PATH:`pwd`/bin
}

build() {
  cd "${srcdir}/${pkgname}"
  yarn
}

package() {
  mkdir -p "${pkgdir}/opt"

  mv "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
  install -D -m644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
