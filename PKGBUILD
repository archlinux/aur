# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=sozi-bin
pkgver=23.07
# the build version is obtained from [here](https://github.com/sozi-projects/Sozi/releases)
_buildver=23.7.25-1690311612
_electronver="20.3.12"
pkgrel=1
pkgdesc="A zooming presentation editor and player based on SVG and JavaScript"
url="http://sozi.baierouge.fr/"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
license=('MPL2')

source=("https://github.com/sozi-projects/Sozi/releases/download/v${pkgver//\~/-}/sozi-${_buildver}.pacman")
sha512sums=('9efe17c882635cfaaf3d781f123fe9a35cc0ad69f1be8690775ddd81658a9c9829e88a8403253ab06a9d28f96f778de164f5e0508e6b13da2bc3fec15841cab1')

depends=("gconf" "libnotify" "alsa-lib" "nss" "gtk2" "gtkmm" "libxtst")
optdepends=(
  'inkscape: for editing the original SVG document'
  'sozi-extras_texts2paths: for converting Text objects to Path objects'
  'sozi-extras_media: for Inkscape audio/video extensions'
  'ffmpeg: for exporting to video formats such as MPEG-4, WebM, or Ogg Vorbis'
)
options=(!strip)

prepare() {
  sed -i 's|Exec=/opt/Sozi/sozi|Exec=sozi|' usr/share/applications/sozi.desktop
}

package() {
  mkdir -p "${pkgdir}/opt/sozi-${pkgver}/"
  cp -a opt/Sozi/* "${pkgdir}/opt/sozi-${pkgver}/"

  install -D -m644 "usr/share/icons/hicolor/256x256/apps/sozi.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/sozi.png"
  install -D -m755 "usr/share/applications/sozi.desktop" "${pkgdir}/usr/share/applications/sozi.desktop"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/sozi-${pkgver}/sozi" "${pkgdir}/usr/bin/"
}

