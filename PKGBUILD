# Maintainer: Tess Hoffman <tess@zrhoffman.net>
pkgname=f5fpc
pkgver=7273.0.0.3
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 x86_64)

source=('license.html::https://cdn.f5.com/product/apm/apps/eula.html')
mirror=vpn.f5networks.net
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
sha256sums=('4507e09374f3e6044952f375e4a1af31505b267c4e0bb066ff159e85694a3d6e')
sha256sums_aarch64=('4f503e035fa56086a2615f94c6921d15e72b7d93175cdec6b097901fbc6bcbde')
sha256sums_x86_64=('dcfe671ac8d028527e20ee1c254d861bf8c4acc84f228da481240ecfb55d4c84')
b2sums=('234729d2ff102638d649e46aa7da193f3a46af396cf063876cbabb71b946ef2df4731519acc48f87e2a2d51f52e45ce494e04320a3fa006fbe5fb734820f51d8')
b2sums_aarch64=('dd595bc76eda9700a7785d4c8235f9c2d8f70b97d4937c35d6fa6c6b6dd7caa1bd15c5876bf78dae569b88439c9865b2b42c9e5f1dfe997d72c72e51c91675ba')
b2sums_x86_64=('6714a424b78d9b0f72f22f673e8feff99a5cce80a14017bd8e5292e5c44144d17d5694a123dae59f1d8bfb28037d6f5d0e316b94d6b1590f38e883e08736ab7a')

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
