# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7230.2022.0711.1
pkgrel=2
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)

source=('LICENSE')
source_x86_64=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://dept-huskyonnet-ns.uw.edu/public/download/linux_f5cli.${CARCH}.deb")
source_armv7h=("linux_f5cli-${pkgver}-${pkgrel}.${CARCH}.deb::https://dept-huskyonnet-ns.uw.edu/public/download/linux_f5cli.armhf.deb")
b2sums_x86_64=('1214173b9d6d6eac0e71aaac2bef0209f5c3226dd0613a6e8e41ce6c78540d41f0a232298bdb7c2cf85611829dedaeffa2390b0b7d2470e67709ad0ec0c6010e')
b2sums_armv7h=('a38d71d621d1c5c23163efaf6dc3007b3e016131039db7cfa3b9d8b9db9e0c645c52f5abf733be71d5ccc8bb70ba2f5f79f43e4efa375d5308c7e70f92f8954b')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha512sums_x86_64=('a16665171d93361f2ea57d0f3203ca104a44d91081ed85ea00f8bc52f291b17ddef33286547b0a38d65ec980c8e1d8b8c68ebe93bec7a4ac7fff309006765907')
sha512sums_armv7h=('a28bae1e5b31a1d12e241fe92c61bd00707ff4e4c48bb9c2ba809dceb978a20c190433ac5f5cfcab5861f97cf3c5437f772e4e58b49f265bbc184611fd9d5fe7')
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
