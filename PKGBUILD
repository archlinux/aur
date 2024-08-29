# Maintainer: Daryl Bennett <kd8bny at gmail dot com>

pkgname=moondeckbuddy-appimage
pkgver=1.6.1
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
  d05f65254349f808f600686fe3fd53efa4247365a0a01dec39e3728872e32139365a668aad44f0974f5f030656d0da44331b21bc0c033e990e6eb9edcec25860
  SKIP
)

_filename="MoonDeckBuddy-${pkgver}-${arch}.AppImage"
_exec_steam="moondeckstream"
_exec_buddy="moondeckbuddy"
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
