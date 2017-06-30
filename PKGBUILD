# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=lyricfier
pkgrel=1
pkgver=0.2.5
pkgdesc="a Spotify Lyrics alternative app"
url="https://github.com/emilioastarita/lyricfier"
provides=('lyricfier')
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('unzip')
source=(
  "${pkgname}.desktop"
  "${pkgname}.png"
)

source_i686+=("${url}/releases/download/${pkgver}/${pkgname}-linux-ia32.zip")
source_x86_64+=("${url}/releases/download/${pkgver}/${pkgname}-linux-x64.zip")

sha256sums_x86_64=('c3bb633cc9f9b8fe258dc51c148eaec1e14eb58a301d78b8e190ca4230a2e073')
sha256sums_i686=('e7c19ff3bf5d1d5b7875cbd15af8506868ef0defcda85efed07aa52faf4b5518')
sha256sums=(
  '2d5d757e286dbf32d75740ffe48e221ffdc2dc10f4fd3f1c5718d7f02fe127a5'
  '73393cdb03f498e5b43126323a6cf64bd529bd37182280f80bff25abc3a04297'
)

package() {
  install -D -m644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "./${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/" "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -sf "../../opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  rm -f "${pkgdir}/opt/${pkgname}/${pkgname}.png"
  rm -f "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  case "$CARCH" in
    i686)
      rm -f "${pkgdir}/opt/${pkgname}/lyricfier-linux-ia32.zip"
      ;;
    x86_64)
      rm -f "${pkgdir}/opt/${pkgname}/lyricfier-linux-x64.zip"
      ;;
  esac
}
