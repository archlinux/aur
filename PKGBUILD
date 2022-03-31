# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=sozi-bin
pkgver=22.03.25
# the build version is obtained from [here](https://github.com/sozi-projects/Sozi/releases)
_buildver=22.3.25-1648241936
_electronver="9.4.4"
pkgrel=1
pkgdesc="A zooming presentation editor and player based on SVG and JavaScript"
url="http://sozi.baierouge.fr/"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
license=('MPL2')

source=("https://github.com/sozi-projects/Sozi/releases/download/v${pkgver//\~/-}/sozi-${_buildver}.pacman")
sha512sums=('f58bd43710b5cf4670ea8023870f0eeba365fa4629065b791073e3afe25a26b89d897bbdc9b0151692ad3c6900b46cb233543b32287b1185d9211e7bc69d06f7')

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

