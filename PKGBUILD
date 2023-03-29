# Maintainer:  qubidt <qubidt at gmail dot com>
# Contributor: n3e <n3e at thathat dot net>
# Contributor: BStrauss3 <bstrauss at acm dot org>

pkgname=perccli
pkgver=7.2110.00
pkgrel=1
pkgdesc='Proprietary controller binary for DELL PERC RAID cards.'
url='https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=mgkfv'
arch=('x86_64')
license=('custom')
source=(
  "https://dl.dell.com/FOLDER09074160M/1/PERCCLI_7.211.0_Linux.tar.gz"
)
# Dell blocks curl user-agent
DLAGENTS=('https::/usr/bin/curl -qgb "" -A notcurl -fLC - --retry 3 --retry-delay 3 -o %o %u')
sha256sums=('1506ac7a33159bcd2e9625ce83fae2186c1cb0ad1f4831a1d4a633f6bdf8c014')

build() {
  bsdtar -xf perccli-007.2110.0000.0000-1.noarch.rpm
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
