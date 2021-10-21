# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=sozi-bin
pkgver=21.09
# the build version is obtained from [here](https://github.com/sozi-projects/Sozi/releases)
_buildver=21.09.14-1631646245
_electronver="9.4.4"
pkgrel=1
pkgdesc="A zooming presentation editor and player based on SVG and JavaScript"
url="http://sozi.baierouge.fr/"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
license=('MPL2')

source=("https://github.com/sozi-projects/Sozi/releases/download/v${pkgver}/sozi-${_buildver}-linux-x64.tar.xz")
sha512sums=('50d2e78d2e7cfaabb84bb90f64c4b4eed615ad88281647bb0a49cb5bf232adc36e90e705e18d3a4b74278d6324cf5996f9a874b1a184517976370b4970ee4046')

depends=("gconf" "libnotify" "alsa-lib" "nss" "gtk2" "gtkmm" "libxtst")
optdepends=(
  'inkscape: for editing the original SVG document'
  'sozi-extras_texts2paths: for converting Text objects to Path objects'
  'sozi-extras_media: for Inkscape audio/video extensions'
  'ffmpeg: for exporting to video formats such as MPEG-4, WebM, or Ogg Vorbis'
)
options=(!strip)

package() {
  cd "${srcdir}/sozi-${_buildver}-linux-x64/"
  mkdir -p "${pkgdir}/opt/sozi-${pkgver}/"
  cp -a * "${pkgdir}/opt/sozi-${pkgver}/"
  rm -r "${pkgdir}/opt/sozi-${pkgver}/install/"

  install -D -m644 "install/sozi.png" "${pkgdir}/usr/share/pixmaps/sozi.png"
  install -D -m755 "install/sozi.desktop" "${pkgdir}/usr/share/applications/sozi.desktop"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/sozi-${pkgver}/sozi" "${pkgdir}/usr/bin/"
}

