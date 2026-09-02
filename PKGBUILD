# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7272.0.0.2
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 x86_64)

source=('license.html::https://cdn.f5.com/product/apm/apps/eula.html')
mirror=vpn.f5networks.net
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
sha256sums=('SKIP')
sha256sums_aarch64=('2a8886a9816b1e81d2e3f2b1a7e11ad77aa504110793d901fa4cf1a82f4556c4')
sha256sums_x86_64=('f9b436e892775b774a83ab7be9c0cc2009f65caf3aec21c68a28450093ceaf24')
b2sums=('SKIP')
b2sums_aarch64=('3845e1caae7a9140bfe8fbe03a03240a5716ed55bbf343b7d3099ba3363806a442a63c45e063588c5da8d80749937a7d2d6be41393cb511c80b3001ad6298144')
b2sums_x86_64=('a6a5b9e0753372740c16791efe825dd4ad39a41ffc6cadc964264d16a47ceb0470c4481740270f192a697a18d513d690f2196b2bbe232f8c2909795d9e09fb1b')

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
