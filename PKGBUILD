# Contributor: Alessandro Guido <alexguido@gmail.com>

pkgname=cnijfilter-mx520series
pkgver=3.90
pkgrel=1
pkgdesc="Canon InkJet printer driver (MX520 series, binary)"
arch=('i686' 'x86_64')
url="https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/mx525.html"
license=('custom')
depends=('popt')
optdepends=('gtk2: Canon maintenance GUI support')
provides=("cnijfilter-common=$pkgver")
conflicts=("cnijfilter-common")
source=(http://gdlp01.c-wss.com/gds/5/0100005155/01/cnijfilter-mx520series-$pkgver-1-deb.tar.gz)
md5sums=('a58da1834d275590193cd91b018053fa')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/cnijfilter-mx520series-${pkgver}-1-deb/packages"
  
  cd $pkgdir
  ar -x "${_debdir}/cnijfilter-common_${pkgver}-1_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  ar -x "${_debdir}/cnijfilter-mx520series_${pkgver}-1_${_pkgarch}.deb" \
        "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/cnijfilter-common/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-common
  mv usr/share/doc/cnijfilter-mx520series/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-mx520series
  rmdir usr/share/doc

  # Weird permissions error from namcap
  chown root usr/lib/bjlib/cnnet.ini
  chgrp root usr/lib/bjlib/cnnet.ini

  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
  chmod 0644 $(find etc -type f)
}

