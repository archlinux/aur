# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=squareline-studio
_pkgname=SquareLine_Studio
pkgver=1.5.0
pkgrel=1
pkgdesc="Visual drag-and-drop UI editor to create beautiful Graphical User Interfaces quickly and easily"
arch=('x86_64')
url="https://squareline.io/"
license=('custom')
source=("https://static.squareline.io/downloads/${_pkgname}_Linux_v${pkgver//./_}.zip")
sha256sums=('b404ac982a866d5d6bd6aab7a960eea04abe78354ee565e29ce91b6771dd935d')

package() {
  install -dm755 ${pkgdir}/opt/
  cp -a ${srcdir}/${_pkgname}_Linux_v${pkgver//./_} ${pkgdir}/opt/${pkgname}

  cd ${pkgdir}/opt/${pkgname}

  # binary
  chmod 755 ${_pkgname}.x86_64 lvgl/lv_font_conv-linux
  find lvgl/ -type d -name 'lvgl_v*' -exec chmod 755 {}/server/micropython  {}/server/server.py \;

  # desktop entry
  sed "s|__folder__|/opt/${pkgname}|g"  squareline_studio.desktop.template > ${pkgname}.desktop
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}

# vim: set sw=2 ts=2 et:
