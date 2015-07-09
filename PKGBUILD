# Maintainer: Ludovico de Nittis <aasonykk [at] gmail [dot] com>
# Contributor:  cidtux <cidtux@gmail.com>
# Modified from canon-pixma-mx870-complete by Charles Wise <charles [at] charlesbwise [dot] com>

pkgname=canon-pixma-mp230-complete
pkgver=3.80
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MP230 series"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100465901.html"
arch=('i686' 'x86_64')
license=('custom')
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi
makedepends=('binutils')
source=('http://gdlp01.c-wss.com/gds/9/0100004659/01/cnijfilter-mp230series-3.80-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/5/0100004695/01/scangearmp-mp230series-2.00-1-deb.tar.gz')
sha1sums=('aa10d1483cec69f10c0c12bc524ac4f1b9c08a8f'
	'df3a723c7e8bdce8fc5708905862aaa17fe333c0')

package(){

  cd ${srcdir}/cnijfilter-mp230series-3.80-1-deb/packages/
  install cnijfilter-common_3.80-1_i386.deb ${pkgdir}
  install cnijfilter-mp230series_3.80-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mp230series-2.00-1-deb/packages
  install scangearmp-common_2.00-1_i386.deb ${pkgdir}
  install scangearmp-mp230series_2.00-1_i386.deb ${pkgdir}
  
  cd ${pkgdir}

  ar -x cnijfilter-common_3.80-1_i386.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.80-1_i386.deb
  rm data.tar.gz
 
  ar -x cnijfilter-mp230series_3.80-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mp230series_3.80-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-common_2.00-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_2.00-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-mp230series_2.00-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mp230series_2.00-1_i386.deb
  rm data.tar.gz

  mkdir ${pkgdir}/usr/share/licenses
  mkdir ${pkgdir}/usr/share/licenses/canon-pixma-mp230-complete
  cd ${pkgdir}/usr/share/doc
  mv cnijfilter-common cnijfilter-mp230series scangearmp-common scangearmp-mp230series ../licenses/canon-pixma-mp230-complete/
  rm -r ${pkgdir}/usr/share/doc

  cd ${pkgdir}/usr/lib/bjlib/
  chmod 644 canon_mfp_net.ini
}
