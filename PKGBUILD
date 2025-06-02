# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=squareline-studio
_pkgname=SquareLine_Studio
pkgver=1.5.2
pkgrel=1
pkgdesc="Visual drag-and-drop UI editor to create beautiful Graphical User Interfaces quickly and easily"
arch=('x86_64')
url="https://squareline.io/"
license=('custom')
source=("https://static.squareline.io/downloads/${_pkgname}_Linux_v${pkgver//./_}.zip")
sha256sums=('a7c5aedb34a2b22f3b79043324a23b9a43500f6469b2e586f38a8ef5f9172326')

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
