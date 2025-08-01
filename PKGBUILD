# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7253.2025.0725.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('512c74cfa7338b7c5d1bb8b4c7b705a52eda0b8bf465439b84284b1c58350720349ee5b7cd8fcbbaa448ed788efbaf864d06f6b844297a8058669a396fd3e16c')
b2sums_armv7h=('580ec9a0c396117f3abffa90f3957ae24a8a01dad6ed1862131eedbcaccbb0dca28c226eabb225104e02953fa12cc76339d1e3c1229387e67a42454b00bea8db')
b2sums_x86_64=('72f91283a43b20f43ce6b5c7c4e4ff42d311b2ae314b8082ba480627c8e9bb4e1b4bfe31d12e94d993c724352556164993a6a33014fe0b6a6445ce335f95be0b')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('340ce909f668c387a1bcc8a7cee19ce0078b573d1ad7b7722f5327b444f218bb')
sha256sums_armv7h=('c66ca4213a59281ebc00add9811734971de354e3d592117ece1423083e15458d')
sha256sums_x86_64=('7b9da72bc31bcda51c52a5331db9faa68361bd48f42d7b43a50899915e28947e')
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
