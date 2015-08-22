# Maintainer: Yuto Tokunaga <yuntan DOT sub1 AT gmail DOT com>

pkgname=scangearmp2-mg7500
pkgver=3.00
pkgrel=1
_pkgver=3.00-1
pkgdesc="Canon InkJet Printer Driver (MG7500, MG5600, MB5300, MB5000, MB2300, MB2000 Series)"
arch=('i686' 'x86_64')
url="http://cweb.canon.jp/drv-upd/ij-mfp/linux-sd-20142h-300.html"
license=('custom')
depends=('gtk2')
provides=("scangearmp2=${pkgver}")
install=scangearmp2-mg7500.install
source=(http://gdlp01.c-wss.com/gds/1/0100006271/01/scangearmp2-${_pkgver}-deb.tar.gz)
md5sums=('b6ccbe9bf884efb9f8ae1aa0fd390609')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/scangearmp2-${_pkgver}-deb/packages"
  
  cd $pkgdir
  ar -x "${_debdir}/scangearmp2_${_pkgver}_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz
  
  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/scangearmp2/LICENSE* usr/share/licenses/${pkgname}
  
  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
  chmod 0644 $(find etc -type f)
}
