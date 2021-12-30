# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=sozi-bin
pkgver=21.12.06
# the build version is obtained from [here](https://github.com/sozi-projects/Sozi/releases)
_buildver=21.12.06-1638805322
_electronver="9.4.4"
pkgrel=1
pkgdesc="A zooming presentation editor and player based on SVG and JavaScript"
url="http://sozi.baierouge.fr/"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
license=('MPL2')

source=("https://github.com/sozi-projects/Sozi/releases/download/v${pkgver}/sozi-${_buildver}-linux-x64.tar.xz")
sha512sums=('b67461ae1670c6bf38e9bfa0689ded498ea0776526584507daf0b81e1971aa219f65dedda63e6a7468c24d02d78f7eccbbe71e0c2f1a93a1a610a647387647b1')

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

