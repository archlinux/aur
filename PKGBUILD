# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7246.2024.0201.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
mirror=vpn.univie.ac.at
source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
b2sums_x86_64=('85fdef0868c6ff352419ce1841da1b89354dfaf2b7271e53b90dc66b91a831b4cb07bb2919e876db9bb3dc66705aa8c1ac19d616a8c25037c194e802acbbdcf9')
b2sums_armv7h=('4ea700d95d792c9453bd4d10d067ea7a46b84ed9171c1dbc61f738b7e1eedc2117329d838c4518e600e778b87a26e4a2600bb8a08fa9c134d26fb5aa5eaa6894')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums_x86_64=('8614d7f45fe9b6a8e8068695b1e09528d027404e9ff2efc73f56f82cb00970c73dc729384f628cf1953d37a96335b3c47d67a6f4aa7b20e8bbff9ceeef19966b')
sha512sums_armv7h=('81bff6817d49580328811d43bf2d232ad28213299983f8bbd563ec43b567364530c6e4f441a5eaba67381178c612ad71909c9d90304ba36de96f6787da6129ed')
sha512sums=('f2ca5fd5052b307c147ac315eb0cda45a6eaf071de30eef6841c74dac239c2d3bc5a0e1513e4bbd5b3057384676b346428609cb366c3d1086acda982acde7a61')

depends=(openssl)
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

package() {
  tar -xf data.tar.gz
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
