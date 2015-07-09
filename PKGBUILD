# Maintainer: Ludovico de Nittis <aasonykk [at] gmail [dot] com>
# Contributor: sm0x (Michael Brunner) <michaelbrunner88@gmail.com>
# Modified from canon-pixma-mx870-complete by Charles Wise <charles [at] charlesbwise [dot] com>

pkgname=canon-pixma-mx390-complete
pkgver=3.90
pkgrel=4
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX390"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100272202.html"
arch=('i686' 'x86_64')
license=('custom')
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-libcups' 'popt' 'lib32-libpng12' 'libusb-compat' 'libtiff')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4')
fi
makedepends=('binutils')
optdepends=('system-config-printer: an easy configuration-tool for printers')

source=('http://gdlp01.c-wss.com/gds/9/0100005149/01/cnijfilter-mx390series-3.90-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/3/0100005173/01/scangearmp-mx390series-2.10-1-deb.tar.gz')
sha1sums=('aac87f818d238dd2e8f92987d2a21c2e212e7c0d'
	'c7f9960bf45a53e0e6bee53dcbce846fc6424950')

package(){
  cd ${srcdir}/cnijfilter-mx390series-3.90-1-deb/packages/
  install cnijfilter-common_3.90-1_amd64.deb ${pkgdir}
  install cnijfilter-mx390series_3.90-1_amd64.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx390series-2.10-1-deb/packages
  install scangearmp-common_2.10-1_amd64.deb ${pkgdir}
  install scangearmp-mx390series_2.10-1_amd64.deb ${pkgdir}

  cd ${pkgdir}

  ar -x cnijfilter-common_3.90-1_amd64.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.90-1_amd64.deb
  rm data.tar.gz

  ar -x cnijfilter-mx390series_3.90-1_amd64.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mx390series_3.90-1_amd64.deb
  rm data.tar.gz

  ar -x scangearmp-common_2.10-1_amd64.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_2.10-1_amd64.deb
  rm data.tar.gz

  ar -x scangearmp-mx390series_2.10-1_amd64.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mx390series_2.10-1_amd64.deb
  rm data.tar.gz

  mkdir ${pkgdir}/usr/share/licenses
  mkdir ${pkgdir}/usr/share/licenses/canon-pixma-mx390-complete
  cd ${pkgdir}/usr/share/doc
  mv cnijfilter-common cnijfilter-mx390series scangearmp-common scangearmp-mx390series ../licenses/canon-pixma-mx390-complete/
  rm -r ${pkgdir}/usr/share/doc

  cd ${pkgdir}/usr/lib/bjlib/
  chmod 644 canon_mfp_net.ini
}
