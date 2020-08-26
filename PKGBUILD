# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7183.2020.0108.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)
source=('LICENSE')
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://vpn.brown.edu/public/download/linux_f5cli.x86_64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armhf.deb::https://vpn.brown.edu/public/download/linux_f5cli.armhf.deb")
sha256sums=(a8f4b5d965dc0279dd5173109892251ce5d107d9912836e6d83a9b6896eb19a1)
sha256sums_x86_64=(7a815246581b55545b4e460562ee0508cb9bdbc554285f15bcfe34c25eeef441)
sha256sums_armv7h=(750e7990e9bbb17b3ff0a23a0278f50be71a58d3fc5f84427093c601294d5b06)
md5sums=(2508fc5e24d46163844dba9534fe7924)
md5sums_x86_64=(51807e92ee23de0928b3be2300b58acf)
md5sums_armv7h=(b23050ee49769888782c212f9c0a633d)
depends=(openssl)
makedepends=(tar)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

package() {
  tar -xf data.tar.gz
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid

  rm -r "${srcdir}/usr/local/bin"

  if [[ "$arch" == armv7h ]]; then
    suffix=armhf
  else
    suffix="$arch"
  fi

  ln -s "/usr/local/lib/F5Networks/${pkgname}_${suffix}" "${pkgdir}"/usr/bin/${pkgname}
  chmod u+s "${srcdir}/usr/local/lib/F5Networks/SSLVPN/svpn_x86_64"

  cp -a usr "${pkgdir}"
}
