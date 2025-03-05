# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7251.2025.0123.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('ce037670f526372cce9aa27bc7c0d04a4209d456a81a8a8a496a404bc5f007bcb8d14709bb8a113b9b062c8a3c051f3ec78c4ac2a7c8524f07c7822fc96ea802')
b2sums_armv7h=('76553e2ac75095473cd8e5b90148b6ced51ed0891eef47b1458164bbe59ffc6a91255b3852c59893e908880c2711e5398a2eb75da342352ab0fe7849e4b0de92')
b2sums_x86_64=('d7face7c91b20e48ab09be7657194d418b40bb021950cb65f36608826792906a779bf1742a796fb8dd2e77bd47690920f19337eb7fb826ed8d027f6d373604ba')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('56a2a7d6ae893a2d3480ab4ee49b9a02f0e89aa21ceb93988c140ffb10c4e01f')
sha256sums_armv7h=('6884ca6ee2716e481c481be7bdcb6a87c8de88eaa3a00665bec287d4eb3f9021')
sha256sums_x86_64=('0fb46d2af591925bc22d9948fa4b73cc7b5c20ca0a1a5f4b5e4184efa5f2138b')
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
