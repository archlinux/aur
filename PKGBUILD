# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

pkgname=koofr
pkgver=eb5e9e0
pkgrel=1
pkgdesc="Managing your Koofr cloud drive"
arch=('x86_64')
url="https://koofr.eu/"
license=('custom')
depends=('gvfs' 'libudev.so')
options=(!strip)
source=(
  "${pkgname}-${pkgver}-linux-${arch}.tar.gz::https://app.koofr.net/dl/apps/linux64"
  "koofr.desktop")
sha512sums=('edfb13dfc82608cb9dd184cfe3533f528f48fcd6c8655fb7b30f91a981b77f66d7afe5127af8e62617884ec94169675c2034b33592bf2d26a864692d9dbef952'
            'e344aa5b345e6f1ff4a77d464682cf28dfa4a5604ee1b0fb7b43451cc6bdce3238fc27ee232763b6380ea5e146c238c3c19638283b220d39bc8091b5a0fd8711')

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
