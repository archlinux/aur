# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7245.2023.1006.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
mirror=vpn.f5.com
source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
b2sums_x86_64=('3e3063a61cbf92c2f3779241cc75ea412b4de528a996d5fddcdfb31f5fe89a07042e27d1e122f27167abfc4969b6a8115ecdec2cfa0edd429385ebe29569fb24')
b2sums_armv7h=('e82390c6c60588549d870d089173de716a212a91167919e8a3fb65e0a60120e3448fb3eb443514947c3a64282c1055a5b16ea39678239007aaf0e516a48a1dd4')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums_x86_64=('7680e16335d2df712883ede4c5437701558ba2bce24e8cd16efc9bde8204ba2343634cf248af9a87c983bbbccceab0151c4d3092eb108a12cf5d72796f652942')
sha512sums_armv7h=('b588e6d33254b6011d75e41a6a05a29f64f2cadc2a283d058f2c1fa8506c51fa62b1bc2859da289924347db886060559b3b86fcfe8b6d0732759828da0571348')
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
