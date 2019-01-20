# Maintainer: Steven Seifried <gitlab@canox.net>
pkgname=spdynu
pkgver=2018.11
pkgrel=0
pkgdesc="An Dynamic DNS Client for spdyn.de"
arch=('any')
url="https://gitlab.com/CANOXNET/spdynu"
license=('GPLv2')
#depends=('')
makedepends=('gcc')
source=(git+https://gitlab.com/CANOXNET/spdynu)
install=
md5sums=('SKIP')

build()
{
cd "${srcdir}/spdynu"
gcc spdynUpdater.c -o spdynu
}

package() {
  mkdir -p "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/etc/"
  mkdir -p "${pkgdir}/etc/systemd/system/"
  cp -r "${srcdir}/spdynu" "${pkgdir}/usr/spdynu"
  chmod u+x "${pkgdir}/usr/spdynu"
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.conf
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.service
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.timer
  cp -r spdynu.conf "${pkgdir}/etc/spdynu.conf"
  cp -r spdynu.service "${pkgdir}/etc/systemd/system/spdynu.service"
  cp -r {srcdir}/spdynu.timer "${pkgdir}/etc/systemd/system/spdynu.timer"
}
