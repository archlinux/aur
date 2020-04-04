# Maintainer: viphe
# Forked from canon-pixma-mx410-complete (maintained by invik)

pkgname=canon-pixma-mx510-complete
pkgver=3.70
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX510 series."
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/pixma_mx514.html?type=drivers&language=en&os=linux%20(64-bit)'
license=('custom')
depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
conflicts=('scangearmp-mx510series-x86_64' 'scangearmp')
install=canon_mx510.install
source=('http://gdlp01.c-wss.com/gds/0/0100004120/01/cnijfilter-mx510series-3.70-1-deb.tar.gz'
	    'http://gdlp01.c-wss.com/gds/2/0100004132/01/scangearmp-mx510series-1.90-1-deb.tar.gz')
md5sums=('fea3347d975f0d7db287aa9a0de5a4d0'
         'a41e42fca48c11a3ac4d1cf91c017ccb')

package(){

  if [ "${CARCH}" = "x86_64" ]; then
    _arch_str='amd64'
  elif [ "${CARCH}" = "i686" ]; then
    _arch_str='i386'
  fi

  echo -e "\nBuilding for ${CARCH} architecture (${_arch_str}).\n"

  cd ${srcdir}/cnijfilter-mx510series-3.70-1-deb/packages/
  install cnijfilter-common_3.70-1_${_arch_str}.deb ${pkgdir}
  install cnijfilter-mx510series_3.70-1_${_arch_str}.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx510series-1.90-1-deb/packages
  install scangearmp-common_1.90-1_${_arch_str}.deb ${pkgdir}
  install scangearmp-mx510series_1.90-1_${_arch_str}.deb ${pkgdir}

  cd ${pkgdir}

  for _deb in cnijfilter-common_3.70-1_${_arch_str}.deb \
    cnijfilter-mx510series_3.70-1_${_arch_str}.deb \
    scangearmp-common_1.90-1_${_arch_str}.deb \
    scangearmp-mx510series_1.90-1_${_arch_str}.deb; do

        bsdtar -xvf ${_deb} data.tar.gz 2> /dev/null
        bsdtar -xvf data.tar.gz 2> /dev/null
        rm -f ${_deb} data.tar.gz

  done

  # Fix license paths
  mkdir -p ./usr/share/licenses/${pkgname}
  mv ./usr/share/doc/* ./usr/share/licenses/${pkgname}
  rmdir ./usr/share/doc
}
