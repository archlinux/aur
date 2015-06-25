# Maintainer: Charles Wise <charles [at] charlesbwise [dot] com>
# Contributor:  Jeremy Sands <cto [at] jeremysands [dot] com>
 
pkgname=canon-pixma-mx870-complete
pkgver=3.30
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX870"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100272302.html"
arch=('i686' 'x86_64')
license=('custom')
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')
fi
makedepends=('binutils')
source=('http://gdlp01.c-wss.com/gds/3/0100002723/01/cnijfilter-mx870series-3.30-1-i386-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/0/0100002730/01/scangearmp-mx870series-1.50-1-i386-deb.tar.gz')
md5sums=('2aae1637d5f4c1bf10095fb5473f18c2'
        'e77cec72a640d1b350c53e483f8792dc')
 
package(){

  cd ${srcdir}/cnijfilter-mx870series-3.30-1-i386-deb/packages/
  install cnijfilter-common_3.30-1_i386.deb ${pkgdir}
  install cnijfilter-mx870series_3.30-1_i386.deb ${pkgdir}
 
  cd ${srcdir}/scangearmp-mx870series-1.50-1-i386-deb/packages
  install scangearmp-common_1.50-1_i386.deb ${pkgdir}
  install scangearmp-mx870series_1.50-1_i386.deb ${pkgdir}
 
  cd ${pkgdir}
 
  ar -x cnijfilter-common_3.30-1_i386.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.30-1_i386.deb
  rm data.tar.gz
 
  ar -x cnijfilter-mx870series_3.30-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mx870series_3.30-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-common_1.50-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_1.50-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-mx870series_1.50-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mx870series_1.50-1_i386.deb
  rm data.tar.gz

  mkdir ${pkgdir}/usr/share/licenses
  mkdir ${pkgdir}/usr/share/licenses/canon-pixma-mx870-complete
  cd ${pkgdir}/usr/share/doc
  mv cnijfilter-common cnijfilter-mx870series scangearmp-common scangearmp-mx870series ../licenses/canon-pixma-mx870-complete/
  rm -r ${pkgdir}/usr/share/doc

  cd ${pkgdir}/usr/lib/bjlib/
  chmod 644 canon_mfp_net.ini

}
