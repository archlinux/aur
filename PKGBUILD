# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=cnijfilter2-mg7700
pkgver=5.20
pkgrel=1
pkgdesc='Canon InkJet Printer Driver (PIXMA MG3640, PIXMA MG3650, PIXMA MG5740, PIXMA MG5750,  PIXMA MG6840, PIXMA MG6850, PIXMA MG7740, PIXMA MG7750)'
arch=('i686' 'x86_64')
url='http://support-th.canon-asia.com/contents/TH/EN/0100690202.html'
license=('custom')
depends=('libcups' 'libxml2')
provides=("cnijfilter2=$pkgver")
source=("http://gdlp01.c-wss.com/gds/2/0100006902/01/cnijfilter2-$pkgver-$pkgrel-deb.tar.gz")
sha256sums=('bec7bb37ce410ea1418a52526f9f7c0e0626979819ce6f7992ef245b37da7dd3')

prepare() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="cnijfilter2-${pkgver}-${pkgrel}-deb/packages"

  ar -x "${_debdir}/cnijfilter2_${pkgver}-${pkgrel}_${_pkgarch}.deb" "data.tar.gz"
  bsdtar -xzf data.tar.gz
}

package() {
  cp -r usr ${pkgdir}

  install -dm755 ${pkgdir}/usr/share/licences/${pkgname}
  mv ${pkgdir}/usr/share/doc/cnijfilter2/LICENSE* ${pkgdir}/usr/share/licences/${pkgname}
}
