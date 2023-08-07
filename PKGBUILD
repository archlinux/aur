# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7243.2023.0720.1
pkgrel=2
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
mirror=vpn.univie.ac.at
source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://${mirror}/public/download/linux_f5cli.${CARCH}.deb")
source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
b2sums_x86_64=('a3a6ab26ee170314a26946fed09d1d99cec8faff20412bb6d1bb070c6d83e676a85f274370f225d2c10f84676824d61da68cc67321d5bafa6c294db23ab4fdbc')
b2sums_armv7h=('8a5797e18e69c77795485b64823bd8e561e9f8222239795a8cbbea09ac6b5bdf69ed6c2e384063bd5268f9bfa8124c5a2fadebd0215db9620040178c946c63b5')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums_x86_64=('94eb2f2dfd404c0f6c98f5186d35f81372d10ca29003919c5f967813f02cf7adbcd430bac8293d8bee92d277f867de312e9ac6497e7178729c9237de31ef0ca8')
sha512sums_armv7h=('8af15d6af4985e76a35e8ffb8d04e6c5fc1630a036eecbb2a1bdf6140ed26ffee56af12ff6a884f7bde48f663d48240da726f9e296dbb74e2f536c63f7eae78e')
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
