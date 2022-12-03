# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

pkgname=koofr
pkgver=6002.b59bd52
pkgrel=1
pkgdesc="Managing your Koofr cloud drive"
arch=('x86_64')
url="https://koofr.eu/"
license=('custom')
depends=('gvfs' 'libudev.so')
options=(!strip)
source=("${pkgname}-${pkgver}-linux-${arch[0]}.tar.gz::https://app.koofr.net/dl/apps/linux64"
        "koofr.desktop")
sha512sums=('f62086ec5ddee18ac97a7314082326ad532832cd1a2020ae22209934054a9b1d91d53172133cc9c0008dd7664cd2c878f86e688f6b39422fc14c718a3b65d234'
            '27c27808ebe8e1d36be6714f2d42c89dd4e338bdf6e76af56c5aaf96197b69d4e96fe5b2a920aa5124bca2caeff88eaefeede90c8e1d695d6880de61936e74f1')

prepare() {
   cd "${pkgname}"
   rm "Install.desktop" "installer.sh"
}

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${pkgname}"

  install -dm755 "${pkgdir}/opt"
  cp -r "./" "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  ln -s "/opt/${pkgname}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/storagegui" "${pkgdir}/usr/bin/${pkgname}"
}
