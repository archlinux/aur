# Contributor: Will Davis (wravix) <wldavis.se@gmail.com>

pkgname=cnijfilter-mx920series
pkgver=3.90
pkgrel=1
pkgdesc="Canon InkJet Printer Driver (MX920 Series)"
arch=('i686' 'x86_64')
url="http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/pixma_mx_series/pixma_mx922"
license=('custom')
depends=('popt')
optdepends=('gtk2: Canon maintenance GUI support')
provides=("cnijfilter-common=$pkgver")
source=(http://gdlp01.c-wss.com/gds/0/0100005170/01/cnijfilter-mx920series-$pkgver-1-deb.tar.gz)
md5sums=('76e30668391521abf749c21d8a46f5fe')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/cnijfilter-mx920series-${pkgver}-1-deb/packages"
  
  cd $pkgdir
  ar -x "${_debdir}/cnijfilter-common_${pkgver}-1_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  ar -x "${_debdir}/cnijfilter-mx920series_${pkgver}-1_${_pkgarch}.deb" \
        "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/cnijfilter-common/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-common
  mv usr/share/doc/cnijfilter-mx920series/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-mx920series
  rmdir usr/share/doc

  # Weird permissions error from namcap
  chown root usr/lib/bjlib/cnnet.ini
  chgrp root usr/lib/bjlib/cnnet.ini

  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
  chmod 0644 $(find etc -type f)
}

