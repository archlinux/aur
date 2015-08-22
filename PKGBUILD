# Maintainer: Yuto Tokunaga <toku DOT yuuto AT gmail DOT com>
# Based on the PKGBUILD for mg6400 series by Vincenzo Mantova (xworld21)

pkgname=cnijfilter2-mg7500
pkgver=5.00
pkgrel=1
_pkgver=5.00-1
pkgdesc="Canon InkJet Printer Driver (MG7500, MG6600, MG5600, MG2900, MB5300, MB5000, MB2300, MB2000, IP110, IB4000, E460 Series)"
arch=('i686' 'x86_64')
url="http://cweb.canon.jp/drv-upd/ij-mfp/linux-pd-20142h-500.html"
license=('custom')
depends=('libcups' 'libxml2')
provides=("cnijfilter2=$pkgver")
source=(http://gdlp01.c-wss.com/gds/5/0100006265/01/cnijfilter2-${_pkgver}-deb.tar.gz)
md5sums=('433e5d53041067deb90584397daec07d')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/cnijfilter2-${_pkgver}-deb/packages"
  
  cd $pkgdir
  ar -x "${_debdir}/cnijfilter2_${_pkgver}_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz
  
  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/cnijfilter2/LICENSE* usr/share/licenses/${pkgname}
  
  # Weird permissions error from namcap
  chown root usr/lib/bjlib2/cnnet.ini
  chgrp root usr/lib/bjlib2/cnnet.ini

  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
}


