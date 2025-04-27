# Maintainer: Daryl Bennett <kd8bny at gmail dot com>

pkgname=moondeckbuddy-appimage
pkgver=1.8.2
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
  dbbda096cdf7e44a110f24e1a8a0d0d8e8c43e1f8050fdfd40d1b7a4d06d5bd8c13a861d74a06cf882fd04f8a4475886a5660beffc246ee82a960a30edeebbb3
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
