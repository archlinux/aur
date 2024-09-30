# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7248.2024.0909.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('715f52a81539cad9fdcbdfd862d99f7adf0bd3d5e3f971684a6cacf8af94ce8989f5d97c47f692e1d97322c9ba1fff62599f1d94df216e553e5f4af826de4d6f')
b2sums_armv7h=('818edc8ab843a1e598ee02007461a42abde4f35935fed7dcfc8d549ef7046e7adcb788f3e498916ac7ea80bb966a171bf9d33fc0db198e5be442da2c53d954f2')
b2sums_x86_64=('447e5a5ef63559302a6613f774b115eda80e6f67ed5aabe741eb556f8a68d3c28e0d3b669121864eaa10eb65a802406acffaa2d8fa077f75f4f1b0939aeadab3')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('1ebb4494da595d99b18afd856fa8d1bdaba0436351d965fe19de50cc5150b34f')
sha256sums_armv7h=('34b8a13cbb75d8cc306fbc87c5feeaffcdf403609b19ed72cf2f49d0cffe732c')
sha256sums_x86_64=('cf2ac63d26fb4f8d1277323c4383082ac3c2125a9c5317396b46f04bffea7eb2')
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
