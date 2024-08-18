# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot-beta-bin
_appname=firebot
pkgver="${_mainver}.63.0"
_appver="${pkgver}-beta3"
pkgrel=1
pkgdesc="A powerful all-in-one bot for Twitch streamers. Updates to Stable and Beta releases"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
provides=("firebot")
conflicts=("firebot")
license=('GPL3')
source=("${url}/releases/download/v${_appver}/${_appname}-v${_appver}-linux-x64.tar.gz"
        "${_appname}.sh"
        "https://raw.githubusercontent.com/crowbartools/Firebot/v${_appver}/src/gui/images/logo.svg"
        "${_appname}.desktop")
sha256sums=('b4d8a9fbec8179c849cccab2213f4d07d76409cdaca3a275b785dbc0978c2cc5'
            '7694f96ec45d7b729c01bc9d50a12805a8a040b4e3f8c5fbdccbed57fe10fef6'
            '6d734f9ea57fcb04ebbc458fc0b222521d209ac587dffd6127f449a7bb73817e'
            'dc9398428560854f246ffa6656259a966bbbacd67cc7dbbd1e862f2766bbf0c6')

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
  cp --no-preserve=mode,ownership "${srcdir}/logo.svg" "${pkgdir}/usr/share/pixmaps/${_appname}.svg"
  rm "${pkgdir}/opt/${_appname}/logo.svg"

  install -dm755 "${pkgdir}/usr/share/applications"
  desktop-file-edit --set-name="Firebot v${_appver}" ${srcdir}/${_appname}.desktop
  cp --no-preserve=mode,ownership "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  chmod +x "${pkgdir}/usr/share/applications/${_appname}.desktop"
  rm "${pkgdir}/opt/${_appname}/${_appname}.desktop"
}
