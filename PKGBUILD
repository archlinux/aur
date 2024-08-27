# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot
pkgver="${_mainver}.63.2"
pkgrel=1
pkgdesc="A powerful all-in-one bot for Twitch streamers"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-x64.tar.gz"
        "${pkgname}.sh"
        "https://raw.githubusercontent.com/crowbartools/Firebot/v${pkgver}/src/gui/images/logo_transparent.png"
        "${pkgname}.desktop")
sha256sums=('bb9197c328e176eb2430c11c7fe879a09a87e087e7123a36896e652f087d4bf6'
            '7694f96ec45d7b729c01bc9d50a12805a8a040b4e3f8c5fbdccbed57fe10fef6'
            'fb725b5eb6107ae23496f6b6550eba834809bbb38879a1cf5b94bcbf1674f480'
            '45a0b16253788a33df8b1687a2b488ad3146b8afdca81c96704b2ba00c98d437')

package() {
  rm ${pkgname}-v${pkgver}-linux-x64.tar.gz

  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/" "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/Firebot v${_mainver}"

  install -dm755 "${pkgdir}/usr/bin/"
  cp --no-preserve=mode,ownership "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
  rm "${pkgdir}/opt/${pkgname}/${pkgname}.sh"

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp --no-preserve=mode,ownership "${srcdir}/logo_transparent.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  rm "${pkgdir}/opt/${pkgname}/logo_transparent.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  desktop-file-edit --set-name="Firebot v${pkgver}" ${srcdir}/${pkgname}.desktop
  cp --no-preserve=mode,ownership "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  chmod +x "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
}
