# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-sdk
pkgver=0.1.28
pkgrel=1
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
sha256sums=('12731332fb4679c3d9790f601cd26308aa2cdefe13bdc815523f4d18e6ce83e3')
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
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/pi/extensions/cursor-sdk"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a \
    docs \
    README.md \
    CHANGELOG.md \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a . "${pkgdir}/usr/share/pi/extensions/cursor-sdk/"
  rm -rf \
    "${pkgdir}/usr/share/pi/extensions/cursor-sdk/README.md" \
    "${pkgdir}/usr/share/pi/extensions/cursor-sdk/CHANGELOG.md" \
    "${pkgdir}/usr/share/pi/extensions/cursor-sdk/docs" \
    "${pkgdir}/usr/share/pi/extensions/cursor-sdk/test" \
    "${pkgdir}/usr/share/pi/extensions/cursor-sdk/LICENSE"
}
