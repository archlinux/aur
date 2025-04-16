# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7252.2025.0318.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('59ba520752a2432293155e7a948be8f8b04d99e4a089117b53068bc50154f8b3eab7d335d5b9aa5618e9d50e937eb99a5dd970a74fb1297107cb749bfef83322')
b2sums_armv7h=('13ca2a3d8749208842f1385d99e71c25e1855cee3e4db3ed01281c9022e91faa37d7a84c50a7a4437001a5a83966b4b699776aee1c7003462ff1b90344cad282')
b2sums_x86_64=('09553e154d04cbeee372a6088aae30e69dd1eda049c8bdc6ef90b82a29304ccfa84e8665a46c627d8dd65208389a85782e12c70d03d15a2e566a5f6a7511ca8f')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('50ed324b55885dbbd8b8e06e260daea991b313de4702f577cd8170f9d31212a9')
sha256sums_armv7h=('9b2dc8382cdc441981c9de025d7f03a8aa2f4d22b488c3d5f668a037b56fd5a0')
sha256sums_x86_64=('54092397d4d14cabe82c9f2418c84d5e8258c91b72b04fbee3b3317e1ec48c15')
sha256sums=('85f06be8b8e438c4cefdad9e8975d1c48fd53446fe35e95d4260ba14ac7f98fd')

depends=(openssl)
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

pkgver() {
  tar -xf data.tar.gz
  cat usr/local/lib/F5Networks/SSLVPN/etc/version.txt
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"

  rm -r "${srcdir}/usr/local/bin"

  if [[ "$CARCH" == armv7h ]]; then
    suffix=armhf
  else
    suffix="$CARCH"
  fi

  chmod u+s "${srcdir}/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}"
  ln -s "/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}" "${pkgdir}/usr/bin/svpn"
  ln -s "/usr/local/lib/F5Networks/${pkgname}_${suffix}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a usr "${pkgdir}"
}
