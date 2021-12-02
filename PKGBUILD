# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

pkgname=koofr
pkgver=5974c04
pkgrel=1
pkgdesc="Managing your Koofr cloud drive"
arch=('x86_64')
url="https://koofr.eu/"
license=('custom')
depends=('gvfs' 'libudev.so')
options=(!strip)
source=("${pkgname}-${pkgver}-linux-${arch}.tar.gz::https://app.koofr.net/dl/apps/linux64"
  "koofr.desktop")
sha512sums=('f39d96d3229fa52abacf7552e718e3a2d8ad7b2d1cb437a27197b7f3026e8a5ade30d739de5883300f46dbfb061c42c853bf123c0497fe5c9f442217df25840d'
  'a2dd10dbe1ab895c75401487b29faae78dcc6d154db34b523d20578ad12fe083fd0ca1c8385a22b553d1238bbf1da5d1b6ddf3d2d8c5f36f5858680a23d7d130')

package() {
  cd ${srcdir}

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  mkdir -p ${HOME}/.config/autostart/
  cp "${pkgname}.desktop" "${HOME}/.config/autostart/${pkgname}.desktop"

  cd ${pkgname}
  install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"

  rm Install.desktop installer.sh icon.png
  install -dm755 "${pkgdir}/opt"
  cp -r "./" "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/storagegui" "${pkgdir}/usr/bin/${pkgname}"
}
