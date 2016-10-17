# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: ItsTheSource <itsthesource at gmail dot com>

pkgname=iscan-plugin-ds-30
pkgver=1.0.1
pkgrel=1
_epsonver=1.0.0
_epsonrel=3
pkgdesc="iscan plugin for Epson WorkForce DS-30"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan-data' 'iscan')
makedepends=('binutils' 'tar')
install=iscan-plugin-ds-30.install

source_i686=("https://download2.ebz.epson.net/iscan/plugin/ds-30/deb/x86/iscan-ds-30-bundle-${pkgver}.x86.deb.tar.gz")
sha256sums_i686=('985313174c822e3a17f268684dc31238285282f5f586c1c36ede2ffba3683dfa')

source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/ds-30/deb/x64/iscan-ds-30-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums_x86_64=('aa6b2e6406cd24e7bd97a361666910197d94ee72cc93ea13c8b90adc7d61bafa')

prepare() {
  if [ "$CARCH" = "i686" ] ; then
    cd ${srcdir}/iscan-ds-30-bundle-${pkgver}.x86.deb/plugins
    ar vx ${pkgname}_${_epsonver}-${_epsonrel}_i386.deb
    tar -zxvf data.tar.gz
  
  elif [ "$CARCH" = "x86_64" ] ; then
    cd ${srcdir}/iscan-ds-30-bundle-${pkgver}.x64.deb/plugins
    ar vx ${pkgname}_${_epsonver}-${_epsonrel}_amd64.deb
    tar -zxvf data.tar.gz
  fi
}

package() {
  if [ "$CARCH" = "i686" ] ; then
    install -d ${pkgdir}/usr
    mv ${srcdir}/iscan-ds-30-bundle-${pkgver}.x86.deb/plugins/usr/lib ${pkgdir}/usr
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/iscan-ds-30-bundle-${pkgver}.x86.deb/plugins/usr/share/doc/${pkgname}/{AVASYSPL.en.txt,AVASYSPL.ja.txt,copyright} \
    ${pkgdir}/usr/share/licenses/${pkgname}/
  
  elif [ "$CARCH" = "x86_64" ] ; then
    install -d ${pkgdir}/usr
    mv ${srcdir}/iscan-ds-30-bundle-${pkgver}.x64.deb/plugins/usr/lib ${pkgdir}/usr
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/iscan-ds-30-bundle-${pkgver}.x64.deb/plugins/usr/share/doc/${pkgname}/{AVASYSPL.en.txt,AVASYSPL.ja.txt,copyright} \
    ${pkgdir}/usr/share/licenses/${pkgname}/
  fi
}

