# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-sdk
pkgver=0.1.40
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
sha256sums=('d438ec3121bf51d835373150fa7fc4f4af3f6d996b59182524ea652ad2f4b39b')
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
