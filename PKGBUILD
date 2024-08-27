# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot-beta-bin
_appname=firebot
pkgver="${_mainver}.63.2"
#_appver="${pkgver}-beta1"
_appver="${pkgver}"
pkgrel=1
pkgdesc="A powerful all-in-one bot for Twitch streamers. Updates to Stable and Beta releases"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
provides=("firebot")
conflicts=("firebot")
license=('GPL3')
source=("${url}/releases/download/v${_appver}/${_appname}-v${_appver}-linux-x64.tar.gz"
        "${_appname}.sh"
        "https://raw.githubusercontent.com/crowbartools/Firebot/v${_appver}/src/gui/images/logo_transparent.png"
        "${_appname}.desktop")
sha256sums=('bb9197c328e176eb2430c11c7fe879a09a87e087e7123a36896e652f087d4bf6'
            '7694f96ec45d7b729c01bc9d50a12805a8a040b4e3f8c5fbdccbed57fe10fef6'
            'fb725b5eb6107ae23496f6b6550eba834809bbb38879a1cf5b94bcbf1674f480'
            '45a0b16253788a33df8b1687a2b488ad3146b8afdca81c96704b2ba00c98d437')

package() {
  rm ${_appname}-v${_appver}-linux-x64.tar.gz

  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/" "${pkgdir}/opt/${_appname}"
	chmod +x "${pkgdir}/opt/${_appname}/Firebot v${_mainver}"

  install -dm755 "${pkgdir}/usr/bin/"
  cp --no-preserve=mode,ownership "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
	chmod +x "${pkgdir}/usr/bin/${_appname}"
  rm "${pkgdir}/opt/${_appname}/${_appname}.sh"

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp --no-preserve=mode,ownership "${srcdir}/logo_transparent.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  rm "${pkgdir}/opt/${_appname}/logo_transparent.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  desktop-file-edit --set-name="Firebot v${_appver}" ${srcdir}/${_appname}.desktop
  cp --no-preserve=mode,ownership "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  chmod +x "${pkgdir}/usr/share/applications/${_appname}.desktop"
  rm "${pkgdir}/opt/${_appname}/${_appname}.desktop"
}
