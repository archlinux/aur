# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7190.2020.0221
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)
source=('LICENSE')
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://connect.healthsystem.virginia.edu/public/download/linux_f5cli.x86_64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armhf.deb::https://connect.healthsystem.virginia.edu/public/download/linux_f5cli.armhf.deb")
sha256sums=(a8f4b5d965dc0279dd5173109892251ce5d107d9912836e6d83a9b6896eb19a1)
sha256sums_x86_64=(84d155c2e77b0317f9f2b1f0c0dcc1f328d052e598249300277daa475687d5cb)
sha256sums_armv7h=(bd7ad730af27132a56ea4c4c00c2dfed9e54366346c6bb3edeb7931bd82064ea)
md5sums=(2508fc5e24d46163844dba9534fe7924)
md5sums_x86_64=(977c74cbd0eb056747f88204016a3e16)
md5sums_armv7h=(fd6a3bfa7ca73b5ea0ae7152a7332135)
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
