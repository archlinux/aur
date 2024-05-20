# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7247.2024.0425.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=remote.abdn.ac.uk
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('f9cb7276863931013ddd7fdb29a2d7d7708464487de17ea299abbdf4f75577528311f214f5dcf64a72237e52fe27f6ee581d653288d69f87ff2543d5eb6d0fa4')
b2sums_armv7h=('472a4df8cee4a128fef5a0ebd80dc3ea864e623fd23ca4385fcf5b3f5299be66be0d2860d77b8dad7e3f9e9c02a3c8fb3c5e409e408a19cde719bd497e81e05f')
b2sums_x86_64=('0252e78a1398d535b54f5e8d7572cd65f5d5b92f39e305a1b080bca38235b25002abf4fb61d1efed91afd59985eaff0e97f6e2e4e0cfceef9d2d3a8bf651df75')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('ec12fb84c3a21f9122d76cef9891bc8a6c01d77a44a3af909a2176a8f8fd0406')
sha256sums_armv7h=('3dac1d7ccd3909231bbc7e9d68411b878ee290076182f7afb912ccf0b6606fd4')
sha256sums_x86_64=('32b48def1b544c5f13fb6ea0e880da2492d8429abbc384a4f7bbf9c3cec4be25')
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
