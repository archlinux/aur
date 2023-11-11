# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
pkgname=open-joystick-display-transparent
pkgver=2.9.0
pkgrel=1
pkgdesc="A powerful and easy to use streamer-ready display for your joystick or gamepad. Completely free and open source. "
arch=('x86_64')
repo="North-West-Wind/${pkgname}"
url="https://github.com/${repo}"
license=('custom')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/${repo}/v${pkgver}/LICENSE.md"
        "https://raw.githubusercontent.com/${repo}/v${pkgver}/app/icons/icon.png"
        "${pkgname}.desktop"
        "ojd.sh")
sha256sums=('b14e17e7be7c605fcb285bfe2e0d781dd69f074b6cf1599083720abbed0f9657'
            '4e93135b5a8b520e8d2704516cce199a59823f0704cd8f7a25a660387da189cc'
            '035a8763987758dc6815641ad1cc0ac37c08eb7d047cbb41a14fe394042bff0d'
            'c9edd5345046d1ec74dac0b36759cadec1906688aaef00b629554f0dbaf3cb00'
            'f8519a915dec18cb9b2b2365387df21ac285767c9c5605b2ebb01517af00bf61')

prepare() {
  cd $srcdir
  mkdir -p $pkgname
  tar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}"
}

package() {
  cd $srcdir
  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

  install -Dm644 icon.png "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -Dm755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 ojd.sh "${pkgdir}/usr/bin/ojd"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
