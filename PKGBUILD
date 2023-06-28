# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7242.2023.0427.1
pkgrel=2
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
mirror=huskyonnet-ns.uw.edu
source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://${mirror}/public/download/linux_f5cli.${CARCH}.deb")
source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
b2sums_x86_64=('4aabd0a14c13d7985c63f659d772b05efed36d4cb1131b70c3040a112e3312db90fcbd5038b25d0e6822fbc999e7f4a34c306641d5ff1e214225909f6e1a63b1')
b2sums_armv7h=('80f83c43e7cb06e8a96c4b52be2bd7376d71603452dd36c1c807668d941795f849062dc542d171e9c253d758d52d9f1024c6da5367855874f7bef9d4ac127dfe')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums_x86_64=('a3a999d6f79e25ebed95d1cad15facb358195f403138e16d4397e65a0340e3001317a3f5e11eed24551c476939b4ec5e90b4d543552a5f8e2ad5b266a4287371')
sha512sums_armv7h=('c175cf81429febba78c4e3cd82bd5c41899389886d43795d424df2d866d339898bd156e2d0a3fc7bcbde041ba72d413ca2f5cf884e3f050a70e66fc1944ed669')
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
