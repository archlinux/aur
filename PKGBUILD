# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7231.2022.1017.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://vpn.uphs.upenn.edu/public/download/linux_f5cli.${CARCH}.deb")
source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://vpn.uphs.upenn.edu/public/download/linux_f5cli.armhf.deb")
b2sums_x86_64=('c764def0ead71040e606bf96c03590173561d932ed2c619d8d1f54a01b5fcc2de43a4476e748ae61cde9c7e226a36085ddc7efeb41f958794622a72bae8d3146')
b2sums_armv7h=('ea4ddd88ce183470df56fae051d69845b0e2b37b1d396b8b1cc31cd13698f95249bd8c0923976e9a51fdf393116a941e7c31f9ea85e8708fc426fea22f39b89c')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums_x86_64=('0042ec04dacc20d13f0153d5c12b2a505ce73a26912cea212d54b1eb038d638534b6b297d666874efac894fd7062508a9c22cc13d699de07822e7f2083f334cb')
sha512sums_armv7h=('e8e9e88bec4db00678b83f9b5b93c6ec617095a602ec48197106308f83c25cae8bfe8d2f1cf59fa8f27ac1ece360cf386a67ae3c5c4cb55dede859ac230077ec')
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
