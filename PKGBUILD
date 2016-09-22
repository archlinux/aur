# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=autodesk-nlm
pkgver=11.13.1.2
pkgrel=1
pkgdesc="FLEXnet License Manager + Autodesk® vendor daemon"
arch=(x86_64)
url="https://knowledge.autodesk.com/customer-service/network-license-administration"
license=(custom:'¯\_(ツ)_/¯')
depends=('gcc-libs' 'ld-lsb')
source=("http://download.autodesk.com/us/support/files/network_license_manager/11_13_1_2_v2/Linux/nlm11.13.1.2_ipv4_ipv6_linux64.tar.gz")
md5sums=('2a531d68bda033f907e6c85e81e5b160')
sha256sums=('f2770d6acbfa24495e7375b8c5b348066c4063df54c0c96c87103c0f0b9b9779')

prepare() {
  bsdtar xvf "nlm${pkgver}_ipv4_ipv6_linux64.rpm"
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -a opt/flexnetserver "$pkgdir/usr/lib/flexnetserver"

  mkdir -p "$pkgdir/usr/bin"
  ln -s ../lib/flexnetserver/lmutil "$pkgdir/usr/bin/lmutil"
  for bin in lm{borrow,diag,hostid,stat}; do
    ln -s lmutil "$pkgdir/usr/bin/$bin"
  done
}

# vim: ts=2:sw=2:et:
