# Maintainer: Ludovico de Nittis <aasonykk [at] gmail [dot] com>
# Contributor: ugarte <ugarteug@gmail.com>
# Modified from canon-pixma-mx870-complete by Jeremy Sands <cto@jeremysands.com>

pkgname=canon-pixma-mx860-complete
pkgver=3.10
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX860"
url="http://support-au.canon.com.au/P/search?model=PIXMA+MX860&menu=download&filter=0&tagname=g_os&g_os=Linux"
arch=('i686' 'x86_64')
license=('custom')
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4')
fi
source=('http://gdlp01.c-wss.com/gds/7/0100001877/01/cnijfilter-mx860series-3.10-1-i386-deb.tar.gz'	
        'http://gdlp01.c-wss.com/gds/0/0100001870/01/scangearmp-mx860series-1.30-1-i386-deb.tar.gz')
sha1sums=('ce47570fc8d7b2fe1fd53a6b745364a054ee383a'
	 'c871b9922035a58e24d2629ad3e1325d1b6feac8')

package(){

  cd ${srcdir}/cnijfilter-mx860series-3.10-1-i386-deb/packages/
  install cnijfilter-common_3.10-1_i386.deb ${pkgdir}
  install cnijfilter-mx860series_3.10-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx860series-1.30-1-i386-deb/packages/
  install scangearmp-common_1.30-1_i386.deb ${pkgdir}
  install scangearmp-mx860series_1.30-1_i386.deb ${pkgdir}

  cd ${pkgdir}

  ar -x cnijfilter-common_3.10-1_i386.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.10-1_i386.deb
  rm data.tar.gz
 
  ar -x cnijfilter-mx860series_3.10-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mx860series_3.10-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-common_1.30-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_1.30-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-mx860series_1.30-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mx860series_1.30-1_i386.deb
  rm data.tar.gz

  mkdir ${pkgdir}/usr/share/licenses
  mkdir ${pkgdir}/usr/share/licenses/canon-pixma-mx860-complete
  cd ${pkgdir}/usr/share/doc
  mv cnijfilter-common cnijfilter-mx860series scangearmp-common scangearmp-mx860series ../licenses/canon-pixma-mx860-complete/
  rm -r ${pkgdir}/usr/share/doc
}


