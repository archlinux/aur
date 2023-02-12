# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=squareline-studio
_pkgname=SquareLine_Studio
pkgver=1.2.1
pkgrel=1
pkgdesc="Visual drag-and-drop UI editor to create beautiful Graphical User Interfaces quickly and easily"
arch=('x86_64')
url="https://squareline.io/"
license=('custom')
source=("https://static.squareline.io/downloads/${_pkgname}_Linux_v${pkgver//./_}.zip")
makedepends=("unzip")
sha256sums=('0cd7a9f0e0ca41d59f4cc2b9a951827b620fe97af23a614bf5405ebb01b081d8')
noextract=("${_pkgname}_Linux_v${pkgver//./_}.zip")

package() {
  install -dm755 ${pkgdir}/opt/${pkgname}
  # cp -a ${srcdir}/* ${pkgdir}/opt/${pkgname}
  unzip ${_pkgname}_Linux_v${pkgver//./_}.zip -d ${pkgdir}/opt/${pkgname}

  cd ${pkgdir}/opt/${pkgname}

  # binary
  chmod 755 SquareLine_Studio.x86_64 lvgl/lvgl_v{8_2_0,8_3_3}/server/{micropython,lv_font_conv-linux}

  # desktop entry
  sed "s|__folder__|/opt/${pkgname}|g"  squareline_studio.desktop.template > ${pkgname}.desktop
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}

# vim: set sw=2 ts=2 et:
