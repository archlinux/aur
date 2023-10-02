# Maintainer:  qubidt <qubidt at gmail dot com>
# Contributor: n3e <n3e at thathat dot net>
# Contributor: BStrauss3 <bstrauss at acm dot org>

pkgname=perccli
pkgver=7.2313.00
pkgrel=1
pkgdesc='Proprietary controller binary for DELL PERC RAID cards.'
url='https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=mgkfv'
arch=('x86_64')
license=('custom')
source=(
  "https://dl.dell.com/FOLDER09770976M/1/PERCCLI_7.2313.0_A14_Linux.tar.gz"
)
# Dell blocks curl user-agent
DLAGENTS=('https::/usr/bin/curl -qgb "" -A notcurl -fLC - --retry 3 --retry-delay 3 -o %o %u')
sha256sums=('db518857870e62ac3690ffdafcb16f55d8f69537c21eaa717c1daff4232e0a75')

build() {
  bsdtar -xf PERCCLI_7.2313.0_A14_Linux/perccli-007.2313.0000.0000-1.noarch.rpm
}

package() {
  case $CARCH in
    # 32-bit executable longer provided
    # i686) exe_file="perccli";;
    x86_64) exe_file="perccli64";;
    *) echo "Unsupported arch: $CARCH"; return 1;;
  esac
  install -d "${pkgdir}/opt/MegaRAID/perccli"
  install -m755 "./opt/MegaRAID/perccli/${exe_file:?}" "${pkgdir}/opt/MegaRAID/perccli"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/MegaRAID/perccli/${exe_file:?}" "${pkgdir}/usr/bin/perccli"
}
