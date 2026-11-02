# Maintainer: Miguel Regueiro <miguelpr4242@gmail.com>

pkgname=camilo-bin
_pkgname=camilo
pkgver=1.0.0
pkgrel=1
pkgdesc='Terminal camera app for Kitty (prebuilt portable binary)'
arch=('x86_64')
url='https://github.com/MiguelRegueiro/camilo'
license=('MIT')
depends=(
  'ffmpeg'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
)
optdepends=('kitty: recommended terminal with graphics protocol support')
provides=("${_pkgname}=${pkgver}")
conflicts=('camilo')

source=("${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('40de3694a2c0b9a3ed59e1cdc20c31c42cc1979db6ad7ad6845c54aeff764f9b')

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "share/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  local size
  for size in 48 128 256 512; do
    install -Dm644 \
      "share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
}
