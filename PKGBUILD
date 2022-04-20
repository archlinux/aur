# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7220.2022.0308.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums=('f2ca5fd5052b307c147ac315eb0cda45a6eaf071de30eef6841c74dac239c2d3bc5a0e1513e4bbd5b3057384676b346428609cb366c3d1086acda982acde7a61')

source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://huskyonnet-ns.uw.edu/public/download/linux_f5cli.${CARCH}.deb")
b2sums_x86_64=('f8298038eed3e34009b5b56c63c46e08101a542ed529d23137e7d062cc76eda4ae7ac30a95be9f33709e57fa842364c9f53f2eb4f50a845c3e010dafedec4ee3')
sha512sums_x86_64=('38d65d18349872b02d43104c9d626d6ec11d82b8359c5178c183b1f0085af3f388f594f56202201c7845711b04de712b7269f910e94ee6c0edfb7a128cc9232a')

source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://huskyonnet-ns.uw.edu/public/download/linux_f5cli.armhf.deb")
b2sums_armv7h=('b880b343f4535d1121e871e30a05bb76064d4e4eb42b6a68fcf83c574575f6db1cfe7e7dc7c1714a655c3a71d7284fdd84f4022d46774306a19148e7d3deb986')
sha512sums_armv7h=('ebc4afbde777a73e541eff5cc8f9e5abf07b722d98e67f0d94f6d724751a542b91c8174d4ec8a8c211ceff5862f3f6de193deaa1d2dbe7a14168c28ded6f1ceb')

depends=(openssl)
conflicts=('f5vpn<7213.2021.0526.1-2')
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
