# Maintainer: Ayceman (Alexandru Ianu) <alexandru.ianu@gmail.com>
# Modified from canon-pixma-mx870-complete by Jeremy Sands <cto@jeremysands.com>

pkgbase=canon-pixma-mx340-complete
pkgname=(canon-pixma-mx340 canon-pixma-common)
pkgver=3.30
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX350"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100272202.html"
arch=('i686' 'x86_64')
license=('custom')
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4')
fi
makedepends=('binutils')
source=('http://gdlp01.c-wss.com/gds/1/0100002721/01/cnijfilter-mx340series-3.30-1-i386-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/8/0100002728/01/scangearmp-mx340series-1.50-1-i386-deb.tar.gz')
md5sums=('b31b8b495e86dbda25fc4688917a9228'
	'c28e04ad07ddcbd235eb72d4503096ae')
provided=('canon-pixma-mx340=3.30' 'canon-pixma-common=1.50')

if [ ${CARCH} == "x86_64" ]; then
    PKGARCH=amd64
else
    PKGARCH=i386
fi

package_canon-pixma-mx340(){
  cd ${srcdir}/cnijfilter-mx340series-3.30-1-i386-deb/packages/
  install cnijfilter-mx340series_3.30-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx340series-1.50-1-i386-deb/packages
  install scangearmp-mx340series_1.50-1_i386.deb ${pkgdir}

  cd ${pkgdir}


  ar -x cnijfilter-mx340series_3.30-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mx340series_3.30-1_i386.deb
  rm data.tar.gz

  ar -x scangearmp-mx340series_1.50-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mx340series_1.50-1_i386.deb
  rm data.tar.gz
}

package_canon-pixma-common(){
  cd ${srcdir}/cnijfilter-mx340series-3.30-1-i386-deb/packages/
  install cnijfilter-common_3.30-1_i386.deb ${pkgdir}
  install cnijfilter-mx340series_3.30-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx340series-1.50-1-i386-deb/packages
  install scangearmp-common_1.50-1_i386.deb ${pkgdir}
  install scangearmp-mx340series_1.50-1_i386.deb ${pkgdir}

  cd ${pkgdir}

  ar -x cnijfilter-common_3.30-1_i386.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.30-1_i386.deb
  rm data.tar.gz

  ar -x scangearmp-common_1.50-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_1.50-1_i386.deb
  rm data.tar.gz
}
