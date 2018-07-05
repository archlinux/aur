# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

set -u
pkgname='cnijfilter-ip1800-bin'
pkgver='2.70'
pkgrel='1'
pkgdesc='Canon IJ Printer Driver for Pixma IP1800 series multifunction'
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/printers/inkjet/pixma_ip_series/pixma_ip1800.aspx'
license=('GPL2' 'LGPL2' 'custom')
depends=('cups' 'ghostscript' 'cnijfilter-common' 'libglade') # 'cnijfilter-common270'
_libpng='libpng12'
depends_i686=('glibc' 'popt' "${_libpng}" 'xz' 'libjpeg-turbo' 'zlib' 'libtiff3' 'gtk' 'libxml')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
source=("http://files.canon-europe.com/files/soft27213/Software/27213.tgz")
md5sums=('9a5e8bc016ed78551a7f5d197212e857')
sha256sums=('553bec45915b8727633ecc780259777817a00d47e1f90f30048b814884403e40')

prepare() {
  set -u
  cd ${srcdir}
  bsdtar -xvf '27213.tgz'
  set +u
}

package() {
  set -u
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/cnijfilter-ip1800series-2.70-1.i386.rpm"
  mv 'usr/local/bin' 'usr/'
  mv 'usr/local/share'/* 'usr/share/'
  rmdir 'usr/local/share' 'usr/local'
  #mv 'usr/lib' 'usr/lib32' # hardcoded paths
  gzip "${pkgdir}/usr/share/cups/model"/*.ppd
  set +u
}
set +u
