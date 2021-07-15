# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=sozi-bin
pkgver=21.02
# the build version is obtained from [here](https://github.com/sozi-projects/Sozi/releases)
_buildver=21.02.21-1613918986
_electronver="9.2.1"
pkgrel=1
pkgdesc="A zooming presentation editor and player based on SVG and JavaScript"
url="http://sozi.baierouge.fr/"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
license=('MPL2')

source=("https://github.com/sozi-projects/Sozi/releases/download/v${pkgver}/Sozi-${_buildver}-linux-x64.tar.xz")
sha512sums=('5c37e0044c827d3d04d993e977ab77f7bb7c0c310c6fccc7a275af771bb983e5d86eb4c00f84f78f6b4e3a1f14aae14643cd44a5c36aa248b2d33a59bf7cfe46')

depends=("gconf" "libnotify" "alsa-lib" "nss" "gtk2" "gtkmm" "libxtst")
optdepends=(
  'inkscape: for editing the original SVG document'
  'sozi-tools_texts2paths: for converting Text objects to Path objects'
  'sozi-extras_media: for Inkscape audio/video extensions'
  'ffmpeg: for exporting to video formats such as MPEG-4, WebM, or Ogg Vorbis'
)
options=(!strip)

package() {
  cd "${srcdir}/Sozi-${_buildver}-linux-x64/"
  mkdir -p "${pkgdir}/opt/sozi-${pkgver}/"
  cp -a * "${pkgdir}/opt/sozi-${pkgver}/"

  install -D -m644 "install/sozi.png" "${pkgdir}/usr/share/pixmaps/sozi.png"
  install -D -m755 "install/sozi.desktop" "${pkgdir}/usr/share/applications/sozi.desktop"

  mkdir -p "${pkgdir}/usr/bin/"
  cd "${pkgdir}/usr/bin/"
  ln -s "/opt/sozi-${pkgver}/Sozi" sozi
}

