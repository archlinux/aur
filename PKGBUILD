# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=eudic
pkgver=12.5.0
_date=2021-02-06
pkgrel=2
pkgdesc="Eudic, a proprietary dictionary software for linux"
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('unknown')
depends=(
         'hicolor-icon-theme'
         'qt5-speech'
         'qt5-webkit'
         )
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/eudic.deb?v=2021-02-06")
sha256sums=('20a2780110aa4024c3dd002415c6cc45b9ba61b209c8745baf2f2f861772b111')

prepare() {
  mkdir -p build

  tar -xf data.tar.xz -C build
}

package() {
  install -dm755 ${pkgdir}/usr/share

  cp -pvr build/usr/share/* ${pkgdir}/usr/share/ 

  # link executable
  mkdir ${pkgdir}/usr/bin/
  ln -s /usr/share/eusoft/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # desktop enrty
  sed -i "s|/usr/share/eusoft/AppRun|${pkgname}|g" ${pkgdir}/usr/share/applications/${pkgname}.desktop
  
  # qt plugin path
  sed -i '4c Prefix = /usr/lib/qt/' ${pkgdir}/usr/share/eusoft/qt.conf
  
  # remove unused files.
  rm -rf ${pkgdir}/usr/share/eusoft/gstreamer-1.0/
  rm -rf ${pkgdir}/usr/share/eusoft/lib/
  rm -rf ${pkgdir}/usr/share/eusoft/plugins/
  rm -rf ${pkgdir}/usr/share/eusoft/*.so.*
  rm -rf ${pkgdir}/usr/share/eusoft/appRun
}
# vim: ts=2 sw=2 et:
