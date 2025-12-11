# Maintainer: NorthWestWind <wsyn148@gmail.com>
# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot
pkgver="${_mainver}.65.1"
pkgrel=1
pkgdesc="A powerful all-in-one bot for Twitch streamers"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
license=('GPL3')
makedepends=("desktop-file-utils")
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-x64.tar.gz"
        "${pkgname}.sh"
        "logo.svg"
        "logo48.png"
        "logo64.png"
        "logo128.png"
        "logo256.png"
        "${pkgname}.desktop")
sha256sums=('39e1e24fdf3d0565a8cd1add3cc03dd18d9893f1741b8dcdbb338d34619c0f65'
            'c5e406b6f05e6cb2d276430c5e53a12581a580c16ca1a4c1258d2a168524ac65'
            '6d734f9ea57fcb04ebbc458fc0b222521d209ac587dffd6127f449a7bb73817e'
            '341c0df9578fc568b14e798ed6a16771a5af280e3a69dbb96364c40f4dc37e08'
            'f92c8a5af237f088de1f91a8385b132f418af70ec7785bebca55089163ee962e'
            '1f440393bb970bba5dcc21897c4acbca602e82414eb714ea5c602f0c6faa2dc8'
            'fb725b5eb6107ae23496f6b6550eba834809bbb38879a1cf5b94bcbf1674f480'
            '6a75854da50330b3795ed67a29c9c8eecf3bc48cc4b804df2cfa124df4373069')

package() {
  rm "${pkgname}-v${pkgver}-linux-x64.tar.gz"

  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/" "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/Firebot v${_mainver}"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  rm "${pkgdir}/opt/${pkgname}/${pkgname}.sh"

  for size in ${_fireboticonsizes}; do
    install -Dm755 "${srcdir}/logo${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done

  install -Dm755 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  for size in ${_setupiconsizes}; do
    install -Dm755 "${pkgdir}/opt/${pkgname}/resources/linux/firebotsetup-icon/${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-firebotsetup.png"
  done

  install -Dm644 "${pkgdir}/opt/${pkgname}/resources/linux/firebotsetup-mimetype.xml" "${pkgdir}/usr/share/mime/packages/firebotsetup.xml"

  desktop-file-edit --set-name="Firebot v${pkgver}" "${srcdir}/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
}
