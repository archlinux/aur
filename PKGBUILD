# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-sdk
pkgver=0.1.20
pkgrel=2
pkgdesc='pi provider extension backed by Cursor SDK local agents'
arch=('any')
url='https://github.com/fitchmultz/pi-cursor-sdk'
license=('MIT')
depends=(
  'nodejs'
)
optdepends=('pi-coding-agent' 'pi-coding-agent-git')
makedepends=(
  'npm'
  'python'
  'make'
  'gcc'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fitchmultz/pi-cursor-sdk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('84ffc26a639aa4e8aae2bad39a2eddbe6eb6fd73ca425d40399331c99a4f5b0d')
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
