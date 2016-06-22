# Maintainer: zoe <chp321 at gmail dot com>

pkgname=iscan-plugin-epson-v500-photo
_pkgname=iscan-plugin-gt-x770
pkgver=1.0.0
pkgrel=1
_pkgver=2.1.2
_pkgrel=1
pkgdesc="iscan plugin for Epson V500 Photo, also called GT-X770"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=FR&CN2=&DSCMI=42097&DSCCHK=309474db9a756a864fd62cf5a96b1b6e6a6e9d4c"
license=('custom:AVASYSPL')
depends=('iscan-data' 'iscan')
makedepends=('binutils' 'tar')
install=${pkgname}.install
md5sums_install=('be4086b1e50cb7e2a2e5d5c1bb5a8848')

source_i686=("https://download2.ebz.epson.net/iscan/plugin/gt-x770/deb/x86/iscan-gt-x770-bundle-${pkgver}.x86.deb.tar.gz")
md5sums_i686+=('1006330345ac3969c70fb46b98578ab4')

source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/gt-x770/deb/x64/iscan-gt-x770-bundle-${pkgver}.x64.deb.tar.gz")
md5sums_x86_64+=('b960a5919ee1a9172780aa379db6fdd4')

prepare() {
  if [ "$CARCH" = "i686" ] ; then
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x86.deb/plugins
    ar vx ${_pkgname}_${_pkgver}-${_pkgrel}_i386.deb
    tar -zxvf data.tar.gz
  
  elif [ "$CARCH" = "x86_64" ] ; then
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/plugins
    ar vx ${_pkgname}_${_pkgver}-${_pkgrel}_amd64.deb
    tar -zxvf data.tar.gz
  fi
}

package() {
  if [ "$CARCH" = "i686" ] ; then
    install -d ${pkgdir}/usr
    mv ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x86.deb/plugins/usr/lib ${pkgdir}/usr
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x86.deb/plugins/usr/share/doc/${_pkgname}/{AVASYSPL.en.txt,AVASYSPL.ja.txt,copyright} \
    ${pkgdir}/usr/share/licenses/${pkgname}/
  
  elif [ "$CARCH" = "x86_64" ] ; then
    install -d ${pkgdir}/usr
    mv ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/plugins/usr/lib ${pkgdir}/usr
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/plugins/usr/share/doc/${_pkgname}/{AVASYSPL.en.txt,AVASYSPL.ja.txt,copyright} \
    ${pkgdir}/usr/share/licenses/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/iscan/
    install -m644 ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/plugins/usr/share/iscan/esfw7C.bin ${pkgdir}/usr/share/iscan/
  fi
}
