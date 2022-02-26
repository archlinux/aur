# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=squareline-studio
_pkgname=SquareLine_Studio
pkgver=1.0.2
pkgrel=1
pkgdesc="Visual drag-and-drop UI editor to create beautiful Graphical User Interfaces quickly and easily"
arch=('x86_64')
url="https://squareline.io/"
license=('custom')
# depends=('dbus' 'alsa-lib')
# makedepends=('rust')
source=("https://static.squareline.io/downloads/${_pkgname}_Linux_v${pkgver//./_}.zip")
sha256sums=('770299431e2988b9319a2e1101d67b3d9f26d3f935af234220df2830e14ea331')

package() {
  install -dm755 ${pkgdir}/opt/${pkgname}
  cp -a ${srcdir}/* ${pkgdir}/opt/${pkgname}

  cd ${pkgdir}/opt/${pkgname}

  # binary
  chmod 755 SquareLine_Studio.x86_64 server/{micropython,lv_font_conv-linux}

  # desktop entry
  sed "s|__folder__|/opt/${pkgname}|g"  squareline_studio.desktop.template > ${pkgname}.desktop
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}

# vim: set sw=2 ts=2 et:
