# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=scangearmp2-mg7700
pkgver=3.20
pkgrel=1
pkgdesc='Canon ScanGear MP (PIXMA MG3640, PIXMA MG3650, PIXMA MG5740, PIXMA MG5750, PIXMA MG6840, PIXMA MG6850, PIXMA MG7740, PIXMA MG7750)'
arch=('i686' 'x86_64')
url='http://support-th.canon-asia.com/contents/TH/EN/0100690502.html'
license=('custom')
depends=('gtk2')
provides=("scangearmp2=$pkgver")
source=("http://gdlp01.c-wss.com/gds/5/0100006905/01/scangearmp2-${pkgver}-${pkgrel}-deb.tar.gz")
sha256sums=('37cad11b1ed7b646b798e0de36585c192ff44849a818f88c0a3daebb4d879dad')

prepare() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="scangearmp2-${pkgver}-${pkgrel}-deb/packages"

  ar -x "${_debdir}/scangearmp2_${pkgver}-${pkgrel}_${_pkgarch}.deb" "data.tar.gz"
  bsdtar -xzf data.tar.gz
}

package() {
  cp -r {usr,etc} ${pkgdir}

  chgrp scanner ${pkgdir}/usr/lib/bjlib/canon_mfp2_net.ini
  chmod 664 ${pkgdir}/usr/lib/bjlib/canon_mfp2_net.ini

  rm ${pkgdir}/usr/share/doc/scangearmp2/changelog.Debian.gz

  install -dm755 ${pkgdir}/usr/share/licences/${pkgname}
  mv ${pkgdir}/usr/share/doc/scangearmp2/LICENSE* ${pkgdir}/usr/share/licences/${pkgname}
}
