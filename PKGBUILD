# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot-beta-bin
_appname=firebot
pkgver="${_mainver}.64.0"
#_appver="${pkgver}-beta1"
_appver="${pkgver}"
pkgrel=2
pkgdesc="A powerful all-in-one bot for Twitch streamers. Updates to Stable and Beta releases"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
provides=("firebot")
conflicts=("firebot")
license=('GPL3')
source=("${url}/releases/download/v${_appver}/${_appname}-v${_appver}-linux-x64.tar.gz"
        "${_appname}.sh"
        "logo.svg"
        "logo48.png"
        "logo64.png"
        "logo128.png"
        "logo256.png"
        "${_appname}.desktop")
sha256sums=('6d4c00c7448c110e0d5df4e2e93a3efafd56db89ff98ca63cc12bab0dd1ac897'
            'c5e406b6f05e6cb2d276430c5e53a12581a580c16ca1a4c1258d2a168524ac65'
            '6d734f9ea57fcb04ebbc458fc0b222521d209ac587dffd6127f449a7bb73817e'
            '341c0df9578fc568b14e798ed6a16771a5af280e3a69dbb96364c40f4dc37e08'
            'f92c8a5af237f088de1f91a8385b132f418af70ec7785bebca55089163ee962e'
            '1f440393bb970bba5dcc21897c4acbca602e82414eb714ea5c602f0c6faa2dc8'
            'fb725b5eb6107ae23496f6b6550eba834809bbb38879a1cf5b94bcbf1674f480'
            '01a5e6e2154a7e067108869b86df4e95cc04e6903a2bb76cb3f053aacad556cb')

package() {
  rm ${_appname}-v${_appver}-linux-x64.tar.gz

  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/" "${pkgdir}/opt/${_appname}"
	chmod +x "${pkgdir}/opt/${_appname}/Firebot v${_mainver}"

  install -dm755 "${pkgdir}/usr/bin/"
  cp --no-preserve=mode,ownership "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
	chmod +x "${pkgdir}/usr/bin/${_appname}"
  rm "${pkgdir}/opt/${_appname}/${_appname}.sh"

  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
  cp --no-preserve=mode,ownership "${srcdir}/logo48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_appname}.png"
  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  cp --no-preserve=mode,ownership "${srcdir}/logo64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_appname}.png"
  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
  cp --no-preserve=mode,ownership "${srcdir}/logo128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  cp --no-preserve=mode,ownership "${srcdir}/logo256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png"
  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  cp --no-preserve=mode,ownership "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

  install -dm755 "${pkgdir}/usr/share/applications"
  desktop-file-edit --set-name="Firebot v${_appver}" ${srcdir}/${_appname}.desktop
  cp --no-preserve=mode,ownership "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  chmod +x "${pkgdir}/usr/share/applications/${_appname}.desktop"
  rm "${pkgdir}/opt/${_appname}/${_appname}.desktop"
}
