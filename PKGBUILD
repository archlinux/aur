# Maintainer:  qubidt <qubidt at gmail dot com>
# Contributor: n3e <n3e at thathat dot net>
# Contributor: BStrauss3 <bstrauss at acm dot org>

pkgname=perccli
pkgver=7.1910.00
pkgrel=1
pkgdesc='Proprietary controller binary for DELL PERC RAID cards.'
url='https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=36g6n'
arch=('x86_64')
license=('custom')
source=(
  "https://dl.dell.com/FOLDER07815522M/1/PERCCLI_7.1910.00_A12_Linux.tar.gz"
)
# Dell blocks curl user-agent
DLAGENTS=('https::/usr/bin/curl -qgb "" -A notcurl -fLC - --retry 3 --retry-delay 3 -o %o %u')
sha256sums=('1adfe4af9b1c851fc8cc59a78573b9ee08d9a4e27d3529cf5ff4a3ef3a3c4239')

build() {
  bsdtar -xf PERCCLI_7.1910.00_A12_Linux/perccli-*.rpm
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
