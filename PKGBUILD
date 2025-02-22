# Maintainer: Daryl Bennett <kd8bny at gmail dot com>

pkgname=moondeckbuddy-appimage
pkgver=1.6.3
pkgrel=163
pkgdesc="A server-side part of the MoonDeck plugin for the SteamDeck."
arch=('x86_64')
license=('LGPL-3.0')
url="https://github.com/FrogTheFrog/moondeck-buddy"
options=(!strip)
source=(
  ${url}/releases/download/v${pkgver}/MoonDeckBuddy-${pkgver}-${arch}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  88c9e5b2d1632775ee1d2f04c4882d087f9eb1ff224f1fe14da8e1b7aff8a1f98715ca9cf3c8d0b1bdeb8d371aaef0d4534614135ba0b15b3a7b3c98adc6c4ec
  SKIP
)

_filename="MoonDeckBuddy-${pkgver}-${arch}.AppImage"
_exec_steam="MoonDeckStream"
_exec_buddy="MoonDeckBuddy"
_install_path="/opt/${pkgname}/"

package() {
    chmod +x "${_filename}"

    # Install sources in /opt
    mkdir -p "${pkgdir}/${_install_path}"
    install -Dm755 ${_filename} "${pkgdir}${_install_path}"

    # Link to exec
    mkdir -p "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}${_filename}" "${pkgdir}/usr/bin/${_exec_steam}"
    ln -s "${_install_path}${_filename}" "${pkgdir}/usr/bin/${_exec_buddy}"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
