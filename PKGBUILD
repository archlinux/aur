# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-sdk
pkgver=0.1.18
pkgrel=4
pkgdesc='pi provider extension backed by Cursor SDK local agents'
arch=('any')
url='https://github.com/fitchmultz/pi-cursor-sdk'
license=('MIT')
depends=(
  'nodejs'
)
makedepends=(
  'npm'
  'python'
  'make'
  'gcc'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fitchmultz/pi-cursor-sdk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8da62187da52be484e51dac64f6be96732628d8d2fce9eb78b940fdabb610b86')
options=('!strip' '!debug')
install='pi-ext.install'

build() {
  cd "${srcdir}/pi-cursor-sdk-${pkgver}"

  npm ci \
    --omit=dev \
    --no-audit \
    --no-fund
}

package() {
  cd "${srcdir}/pi-cursor-sdk-${pkgver}"

  install -d "${pkgdir}/usr/share/pi/extensions/${pkgname}"
  cp -a \
    src \
    scripts \
    package.json \
    package-lock.json \
    node_modules \
    "${pkgdir}/usr/share/pi/extensions/${pkgname}/"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a \
    docs \
    README.md \
    CHANGELOG.md \
    "${pkgdir}/usr/share/doc/${pkgname}/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
