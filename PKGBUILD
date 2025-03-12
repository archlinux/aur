# Maintainer: Daryl Bennett <kd8bny at gmail dot com>

pkgname=moondeckbuddy-appimage
pkgver=1.7.0
pkgrel=1
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
  9826518029cca63f42816ce9ea31f70af00197fe4b124afa2d114fc2fa359d4cbfab0570ddf6428a6efca6c99432cfb7673446edf8ce7d05e34b21fc393cff46
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
