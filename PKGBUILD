# Maintainer: zoe <chp321@gmail.com>

pkgname=u-gotme
pkgver=2.3
pkgrel=1
pkgdesc="Software to download and upload tracks, routes and waypoints to the I-gotU series of GPS loggers : GT-800, GT-800Pro, GT-820Pro and GT-900Pro."
arch=('i686' 'x86_64')
if test "$CARCH" == x86_64; then
  _arch="64"
fi
if test "$CARCH" == i686; then
  _arch="32"
fi
url="http://u-gotme.deepocean.net/"
license=('GPL')
depends=('java-runtime')
install=${pkgname}.install
source=("http://blog.studioblueplanet.net/wp-content/files/${pkgname}/${pkgname}-version${pkgver}.zip"
         "${pkgname}48.png" "${pkgname}.desktop" "${pkgname}.install")
md5sums=(
'd7458b46e93b5ee386c50ae0df35bfad'
'06558d55015c55eb5a518603fefe48f7'
'2c326c52127c7aa8522e450b50b1b061'
'e264102987e6e1d75310da548b9ed395')

                    
package() {
  mkdir -p ${pkgdir}/usr/share/java/
  mv ${srcdir}/${pkgname}/linux_${_arch}/ ${pkgdir}/usr/share/java/
  cd ${pkgdir}/usr/share/java/linux_${_arch}
  if test "$CARCH" == x86_64; then
  mv start64 ${pkgname}
  fi
  if test "$CARCH" == i686; then
  mv start ${pkgname}
  fi
  sed -i '2i\cd /usr/share/java/u-gotme/' ${pkgname}
  chmod 755 ${pkgname}
  cd ..
  mv linux_${_arch} ${pkgname}
  cp ${srcdir}/${pkgname}/INSTALL_AND_RUN.TXT ${pkgdir}/usr/share/java/${pkgname}/INSTALL_AND_RUN.TXT
  cp ${srcdir}/${pkgname}/README.TXT ${pkgdir}/usr/share/java/${pkgname}/README.TXT
  
# install icon
  install -DTm644 ${srcdir}/${pkgname}48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}48.png
  
# install file.desktop  
  install -DTm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  mkdir -p ${pkgdir}/usr/bin/
  ln -s ${pkgdir}/usr/share/java/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}