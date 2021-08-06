# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=sozi-bin
pkgver=21.08.02
# the build version is obtained from [here](https://github.com/sozi-projects/Sozi/releases)
_buildver=21.08.02-1627894333
_electronver="9.4.4"
pkgrel=1
pkgdesc="A zooming presentation editor and player based on SVG and JavaScript"
url="http://sozi.baierouge.fr/"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
license=('MPL2')

source=("https://github.com/sozi-projects/Sozi/releases/download/v${pkgver}/sozi-${_buildver}-linux-x64.tar.xz")
sha512sums=('8c161160dca6b8ffba9f9be792d34dfe2dc23b27cd4a0f12b29eb0f91ec371b8e115048542eb9bbc4cb6c286e554e55f8bd42f7586ba0a169e867cc290f6058a')

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

