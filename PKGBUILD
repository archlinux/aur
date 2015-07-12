# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: MagicSeb
# Based on the PKGBUILD for 6400 series by Vincenzo Mantova <xworld21@users.sf.net>

pkgname=cnijfilter-mg3500series
pkgver=4.00
pkgrel=1
pkgdesc="Canon InkJet Printer Driver (mg3500 Series)"
arch=('i686' 'x86_64')
url="http://www.canon.co.uk/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MG_series/PIXMA_mg3550.aspx"
license=('custom')
depends=('popt')
provides=("cnijfilter-common=$pkgver")
source=(http://gdlp01.c-wss.com/gds/4/0100005504/01/cnijfilter-mg3500series-$pkgver-1-deb.tar.gz)
md5sums=('019d208676264cc0aa90eb98344d3be3')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/cnijfilter-mg3500series-${pkgver}-1-deb/packages"
  
  cd $pkgdir
  ar -x "${_debdir}/cnijfilter-common_${pkgver}-1_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  ar -x "${_debdir}/cnijfilter-mg3500series_${pkgver}-1_${_pkgarch}.deb" \
        "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/cnijfilter-common/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-common
  mv usr/share/doc/cnijfilter-mg3500series/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-mg3500series
  rmdir usr/share/doc

  # Weird permissions error from namcap
  chown root usr/lib/bjlib/cnnet.ini
  chgrp root usr/lib/bjlib/cnnet.ini

  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
  chmod 0644 $(find etc -type f)
}

