# Maintainer: Miguel Regueiro <miguelpr4242@gmail.com>

pkgname=enzo-bin
_pkgname=enzo
pkgver=1.1.0
pkgrel=1
pkgdesc='Terminal video player with a graphical interface (prebuilt portable binary)'
arch=('x86_64')
url='https://github.com/MiguelRegueiro/enzo'
license=('MIT AND LGPL-2.1-or-later AND BSD-2-Clause')
depends=(
  'freetype2'
  'fribidi'
  'gcc-libs'
  'glibc'
  'gnutls'
  'harfbuzz'
  'hicolor-icon-theme'
  'libpulse'
  'xz'
  'zlib'
)
provides=("${_pkgname}=${pkgver}")
conflicts=('enzo')
source=("${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('5f8912642de28dda10edbac26a038544265a162ac823fe24dfa43c5d43258561')

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md CHANGELOG.md THIRD_PARTY_NOTICES.md \
    -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  local size
  for size in 48 128 256 512; do
    install -Dm644 \
      "share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
}
