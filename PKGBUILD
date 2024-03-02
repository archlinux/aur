# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=squareline-studio
_pkgname=SquareLine_Studio
pkgver=1.4.0
pkgrel=1
pkgdesc="Visual drag-and-drop UI editor to create beautiful Graphical User Interfaces quickly and easily"
arch=('x86_64')
url="https://squareline.io/"
license=('custom')
source=("https://static.squareline.io/downloads/${_pkgname}_Linux_v${pkgver//./_}.zip")
makedepends=("unzip")
sha256sums=('753f1deccaea3a45e959b95fc5ec9e12cc1ecb3a936a37756e95429b2297f0bd')
noextract=("${_pkgname}_Linux_v${pkgver//./_}.zip")

package() {
  install -dm755 ${pkgdir}/opt/${pkgname}
  # cp -a ${srcdir}/* ${pkgdir}/opt/${pkgname}
  unzip ${_pkgname}_Linux_v${pkgver//./_}.zip -d ${pkgdir}/opt/${pkgname}

  cd ${pkgdir}/opt/${pkgname}

  # binary
  chmod 755 SquareLine_Studio.x86_64 lvgl/lv_font_conv-linux
  chmod 755 SquareLine_Studio.x86_64 lvgl/lvgl_v{8_2_0,8_3_3,8_3_4}/server/{micropython,server.py}

  # desktop entry
  sed "s|__folder__|/opt/${pkgname}|g"  squareline_studio.desktop.template > ${pkgname}.desktop
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}

# vim: set sw=2 ts=2 et:
