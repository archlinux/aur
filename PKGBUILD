# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG kernel module (AWG 3.0) with Linux 7.1.5 udp_tunnel compat"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.0.20260731.04
_tag=v3.0.20260731-04
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-linux" "amneziawg-linux-hardened")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/${_tag}.tar.gz"
        "kernel-7.1.5-udp-tunnel.patch")
sha256sums=('cc0b353107064c13ae85ff4f2077b4a0164de0e5e3b335d57dc720c72356f7a8'
            'ca70c83f50bf6c52bed5aff370ceb2c7a94bf1e79afdf2b8d21a5700dadc9128')

prepare() {
  cd "amneziawg-linux-kernel-module-${_tag#v}"
  patch -Np1 -i "${srcdir}/kernel-7.1.5-udp-tunnel.patch"
}

package() {
  depends+=("dkms")
  cd "amneziawg-linux-kernel-module-${_tag#v}/src"
  make DESTDIR="${pkgdir}" dkms-install
}
