# Maintainer: Tess Hoffman <tess@zrhoffman.net>
pkgname=f5fpc
pkgver=7274.0.0.2
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 x86_64)

source=('license.html::https://cdn.f5.com/product/apm/apps/eula.html')
mirror=vpn.f5networks.net
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
sha256sums=('4507e09374f3e6044952f375e4a1af31505b267c4e0bb066ff159e85694a3d6e')
sha256sums_aarch64=('54d0c3095f84ab1204a34ef2c44021759619556ba3aa988b26175ad2e0e12eb0')
sha256sums_x86_64=('d565411a631e529fc6da1d4c3017b7852c904f7cdc2a4df8c0e5f69c1d6ceda6')
b2sums=('234729d2ff102638d649e46aa7da193f3a46af396cf063876cbabb71b946ef2df4731519acc48f87e2a2d51f52e45ce494e04320a3fa006fbe5fb734820f51d8')
b2sums_aarch64=('926865d579137dedc722650a8b01611d1006526dd4f0340852172ffb25dc5da3ade140378eaa12a3d8ab0ba3eafba0cde68cc8b3e91dc23452177e25078cf43f')
b2sums_x86_64=('295e5d5b22efd35491517a5a809bd0ee87e8e8e380dda06da6cd322d0da648a4560c352d4b89f23de81e16b9db058ce17c36a519a4ea1ed3a8b1af154e3c07b3')

depends=(openssl)
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/en-us/edge-client-7-2-7/big-ip-access-policy-manager-edge-client-and-application-configuration-7-2-7/clients-for-linux.html#linux-client-commands'
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
