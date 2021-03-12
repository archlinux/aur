# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7211.2021.0107.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)
source=('LICENSE')
sha256sums=(a8f4b5d965dc0279dd5173109892251ce5d107d9912836e6d83a9b6896eb19a1)
md5sums=(2508fc5e24d46163844dba9534fe7924)
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://connect.healthsystem.virginia.edu/public/download/linux_f5cli.x86_64.deb")
sha256sums_x86_64=(5825d955a56a908e9187ba0e9a4edd3eac450e7721c12293b7eda6a007e30b87)
md5sums_x86_64=(e6cb6fed4f32fd56044f99f6cbc14eff)
source_armv7h=("linux_f5cli-${pkgver}.armhf.deb::https://vpn.brown.edu/public/download/linux_f5cli.armhf.deb")
sha256sums_armv7h=(afc2253844a0b906d401a1c53e991f3d1bb3d8c7cc2846723bed42f10affced1)
md5sums_armv7h=(5d86b106d826f56908eddc8fd83eb12e)
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
