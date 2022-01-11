# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7214.2021.1126.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
b2sums=(c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c)
sha512sums=(f2ca5fd5052b307c147ac315eb0cda45a6eaf071de30eef6841c74dac239c2d3bc5a0e1513e4bbd5b3057384676b346428609cb366c3d1086acda982acde7a61)

source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://vpn.emory.edu/public/download/linux_f5cli.${CARCH}.deb")
b2sums_x86_64=('70e2ae13fdf613ca4de9d30ce5d2d876515f0349b92397dfc71e91cc85950326da74d6bf53a6ac757102aa48bec27d96bf79bb4f408d1d2b4bb4d5cb631a5d94')
sha512sums_x86_64=('10dc5096b9839ed874d26082859f0ce2a094e3185dcab2d8958426b8bf95a04558104ad8a7b598f0d4c6f91e6d6ab10053ee41c731ecd9fc500899a8734bef35')

source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://vpn.emory.edu/public/download/linux_f5cli.armhf.deb")
b2sums_armv7h=(ac60131263f5d0addda3efb29a17254b9f70f8e3468a8f76967fbf8c3d390361869345f93b03a187483328abbd720ff92f9863a3839f87f350ea9646b328919f)
sha512sums_armv7h=(282daf3c5b655d66469faa35a17f69d7e6c4b8a9b172478058254b7b18845827ae9dc2318f614898db2b475d74c619e30033d250c9acabc93b6c9981aa352ec3)

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
