# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=dehelper
pkgver=12.5.3
_date=2021-02-06
_lang=de
_flang=German
pkgrel=1
pkgdesc="Proprietary  ${_flang} dictionary software for linux"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/${pkgname}"
license=('unknown')
depends=(
         'hicolor-icon-theme'
         'qt5-speech'
         'qt5-webkit'
         )
provides=("eudic-${_lang}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/${pkgname}.deb?v=${_date}")
sha512sums=('a8bc1f04975dee9242f17bca9db57db735d9b29655418b17d8a3e52ecf72baf2d004f40ad9c41c8a1c1ed2d044cdd403005d947d992cd70e471ecf5c16ba20a6')

prepare() {
  mkdir -p build

  tar -xf data.tar.xz -C build
}

package() {
  mkdir -p ${pkgdir}/usr/share/eusoft-${pkgname}
  mv build/usr/share/eusoft-${pkgname}/* ${pkgdir}/usr/share/eusoft-${pkgname}
  
  
  cp -pr build/usr/share/* ${pkgdir}/usr/share/ 
  

  # link executable
  mkdir ${pkgdir}/usr/bin/
  ln -s /usr/share/eusoft-${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # desktop enrty
  sed -i "s|/usr/share/eusoft-${pkgname}/AppRun|${pkgname}|g" ${pkgdir}/usr/share/applications/eusoft-${pkgname}.desktop
  
  # qt plugin path
  sed -i '4c Prefix = /usr/lib/qt/' ${pkgdir}/usr/share/eusoft-${pkgname}/qt.conf
  
  # remove unused files.
  rm -rf ${pkgdir}/usr/share/eusoft-${pkgname}/gstreamer-1.0/
  rm -rf ${pkgdir}/usr/share/eusoft-${pkgname}/lib/
  rm -rf ${pkgdir}/usr/share/eusoft-${pkgname}/plugins/
  rm -rf ${pkgdir}/usr/share/eusoft-${pkgname}/*.so.*
  rm -rf ${pkgdir}/usr/share/eusoft-${pkgname}/AppRun
  
}
# vim: ts=2 sw=2 et:
