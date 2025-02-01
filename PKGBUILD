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
  cfd15a076d8b72781734398002649edc8c0442040932d297de5735557e616a15b42b6a1d82e35d33d76adfbd6c93d85436de0fab1c7700ce8af17e9cb82c6875
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
