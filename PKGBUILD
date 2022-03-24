# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=cnijfilter2-g3010
pkgver=5.60
pkgrel=1
pkgdesc='Canon InkJet Printer Driver, PIXMA G3010 series (PIXMA G3410, PIXMA G3411, PIXMA G3415, PIXMA G3510, PIXMA G3515, PIXMA G4410, PIXMA G4411, PIXMA G4510, PIXMA G4511)'
arch=('i686' 'x86_64')
url='https://th.canon/en/support/PIXMA%20G3010/model'
license=('custom')
depends=('libcups' 'libxml2')
provides=("cnijfilter2=$pkgver")
source=("https://gdlp01.c-wss.com/gds/8/0100009488/01/cnijfilter2-$pkgver-$pkgrel-deb.tar.gz")
sha256sums=('d75344561828eb180f34d6fd2d5b1a05eb03aca31365896589b7fcbcb75ab985')

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
