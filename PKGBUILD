# Maintainer:  qubidt <qubidt at gmail dot com>
# Contributor: n3e <n3e at thathat dot net>
# Contributor: BStrauss3 <bstrauss at acm dot org>

pkgname=perccli
pkgver=7.5.007.0529
pkgrel=1
pkgdesc='Proprietary controller binary for DELL PERC RAID cards.'
url='https://www.dell.com/support/home/en-us/drivers/driversdetails?driverId=NF8G9'
arch=('i686' 'x86_64')
license=('custom')
source=(
  "https://dl.dell.com/FOLDER05235308M/1/perccli_linux_NF8G9_A07_7.529.00.tar.gz"
)
# Dell blocks curl user-agent
DLAGENTS=('https::/usr/bin/curl -qgb "" -A notcurl -fLC - --retry 3 --retry-delay 3 -o %o %u')
sha256sums=('bf5b364d5d3d7035f5973159b569731b9535e2a35f63a7f6a900a8cca15b9f29')

build() {
  bsdtar -xf perccli-*.rpm
}

package() {
  case $CARCH in
    i686) exe_file="perccli";;
    x86_64) exe_file="perccli64";;
    *) echo "Unknown arch: $CARCH"; return 1;;
  esac
  install -d "${pkgdir}/opt/MegaRAID/perccli"
  install -m755 "./opt/MegaRAID/perccli/${exe_file:?}" "${pkgdir}/opt/MegaRAID/perccli"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/MegaRAID/perccli/${exe_file:?}" "${pkgdir}/usr/bin/perccli"
}
