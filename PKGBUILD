# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot-beta-bin
_appname=firebot
pkgver="${_mainver}.65.0"
_appver="${pkgver}-beta2"
#_appver="${pkgver}"
pkgrel=3
pkgdesc="A powerful all-in-one bot for Twitch streamers. Updates to Stable and Beta releases"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
provides=("firebot")
conflicts=("firebot")
license=('GPL3')
makedepends=("desktop-file-utils")
source=("${url}/releases/download/v${_appver}/${_appname}-v${_appver}-linux-x64.tar.gz"
        "${_appname}.sh"
        "logo.svg"
        "logo48.png"
        "logo64.png"
        "logo128.png"
        "logo256.png"
        "${_appname}.desktop")
sha256sums=('20c296ea5ae6bd1f5030f4dd3e3bb2e05b921de33593e27f98bb79611d33e37a'
            'c5e406b6f05e6cb2d276430c5e53a12581a580c16ca1a4c1258d2a168524ac65'
            '6d734f9ea57fcb04ebbc458fc0b222521d209ac587dffd6127f449a7bb73817e'
            '341c0df9578fc568b14e798ed6a16771a5af280e3a69dbb96364c40f4dc37e08'
            'f92c8a5af237f088de1f91a8385b132f418af70ec7785bebca55089163ee962e'
            '1f440393bb970bba5dcc21897c4acbca602e82414eb714ea5c602f0c6faa2dc8'
            'fb725b5eb6107ae23496f6b6550eba834809bbb38879a1cf5b94bcbf1674f480'
            '6a75854da50330b3795ed67a29c9c8eecf3bc48cc4b804df2cfa124df4373069')
_fireboticonsizes="48 64 128 256"
_setupiconsizes="16 24 32 48 64 96 128 256 512"

package() {
  rm ${_appname}-v${_appver}-linux-x64.tar.gz

  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/" "${pkgdir}/opt/${_appname}"
	chmod +x "${pkgdir}/opt/${_appname}/Firebot v${_mainver}"

  install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
  rm "${pkgdir}/opt/${_appname}/${_appname}.sh"

  for size in ${_fireboticonsizes}; do
    install -Dm755 "${srcdir}/logo${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_appname}.png"
  done

  install -Dm755 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

  for size in ${_setupiconsizes}; do
    install -Dm755 "${pkgdir}/opt/${_appname}/resources/linux/firebotsetup-icon/${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-firebotsetup.png"
  done

  install -Dm644 "${pkgdir}/opt/${_appname}/resources/linux/firebotsetup-mimetype.xml" "${pkgdir}/usr/share/mime/packages/firebotsetup.xml"

  desktop-file-edit --set-name="Firebot v${_appver}" "${srcdir}/${_appname}.desktop"
  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  rm "${pkgdir}/opt/${_appname}/${_appname}.desktop"
}
