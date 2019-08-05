# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgver_openzwafe=1.5
pkgname=gateway
pkgver=0.8.0
pkgrel=1
pkgdesc="Things Gateway by Mozilla"
arch=(any)
url="https://iot.mozilla.org/gateway/"
license=(MPL2)
depends=('libusb' 'nodejs')
optdepends=()
makedepends=(
  'pkgconfig'
  'curl'
  'nvm'
  'boost'
  'boost-libs'
  'bluez'
  'bluez-libs'
  'glib2'
  'libusb'
  'autoconf'
  'libpng'
  'git'
  'gcc'
  'nodejs-lts-carbon'
  'nanomsg' 
)
source=(gateway.install
        gateway.service
        git+https://github.com/mozilla-iot/gateway.git#tag=${pkgver})
sha1sums=('57cadc31a5abbeb88ec5b9728dc6c7d493ca9115'
          'b3cc211e2725bc4ec80037d413c86563092b3a25'
          'SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  npm install
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
  install -D -m644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
