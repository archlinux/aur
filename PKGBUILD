# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7271.0.0.4
pkgrel=2
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 x86_64)

source=('license.html::https://cdn.f5.com/product/apm/apps/eula.html')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
sha256sums=('4507e09374f3e6044952f375e4a1af31505b267c4e0bb066ff159e85694a3d6e')
sha256sums_aarch64=('92cb4ed4b923e1878a887091a97fcde170477549c6765753fa0b484687465299')
sha256sums_x86_64=('e6b33c2c2d36a0b79271c634f83188bcf9762d749887f2f6d304e466312a18cf')
b2sums=('234729d2ff102638d649e46aa7da193f3a46af396cf063876cbabb71b946ef2df4731519acc48f87e2a2d51f52e45ce494e04320a3fa006fbe5fb734820f51d8')
b2sums_aarch64=('6397d561d68c1583b6190813ce4db4463070194d2ba72f211034647442418da936eb96bf60617904706e1d6990c6c9c32ef060627fa55bcc2f3ab2c9d81fff16')
b2sums_x86_64=('159952b9de520a98a9ff6d4a4f855809e4ec2016c5f2918a5d19871a8574b2434aa4499ed991fc80268c27caf55ac0866d463ddce2fbbeb4de28e0026a986d9d')

depends=(openssl)
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

pkgver() {
  tar xf data.tar.zst
  cat usr/local/lib/F5Networks/SSLVPN/etc/version.txt
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"

  rm -r "${srcdir}/usr/local/bin"

  suffix="$CARCH"
  chmod u+s "${srcdir}/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}"
  ln -s "/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}" "${pkgdir}/usr/bin/svpn"
  ln -s "/usr/local/lib/F5Networks/${pkgname}_${suffix}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a usr "${pkgdir}"
}
