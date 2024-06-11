# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
# Maintainer: Dennis Rijsdijk, dennisrijsdijk <hello@dennis.gg>
_mainver=5
pkgname=firebot
pkgver="${_mainver}.62.1"
pkgrel=3
pkgdesc="A powerful all-in-one bot for Twitch streamers"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-x64.tar.gz"
        "${pkgname}.sh"
        "https://raw.githubusercontent.com/crowbartools/Firebot/v${pkgver}/src/gui/images/macTrayIcon%403x.png"
        "${pkgname}.desktop")
sha256sums=('bc57885e9ab54c38d925eb4f42fefa696b69106b8c77bc387d2b8153fe8b64eb'
            '7694f96ec45d7b729c01bc9d50a12805a8a040b4e3f8c5fbdccbed57fe10fef6'
            '99bcae97bdfe4ab742664ddbc70fa3ead6d6c26cc468f1b0f86e6d1f0ca68703'
            '45a0b16253788a33df8b1687a2b488ad3146b8afdca81c96704b2ba00c98d437')

prepare() {
  cd $srcdir
  mkdir -p $pkgname
  tar -xf ${pkgname}-v${pkgver}-linux-x64.tar.gz -C ${pkgname}
}

package() {
  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/Firebot v${_mainver}"

  install -dm755 "${pkgdir}/usr/bin/"
  cp --no-preserve=mode,ownership "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp --no-preserve=mode,ownership "${srcdir}/macTrayIcon%403x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  desktop-file-edit --set-name="Firebot v${pkgver}" ${srcdir}/${pkgname}.desktop
  cp --no-preserve=mode,ownership "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  chmod +x "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
