# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG kernel module (AWG 3.1) with Linux 7.1.5+ udp_tunnel compat"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260812
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-linux" "amneziawg-linux-hardened")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "kernel-7.1.5-udp-tunnel.patch")
sha256sums=('a85817876676d5933385712657bd5525a0a2939baaf057f68e3629c7b4553c82'
            'ca70c83f50bf6c52bed5aff370ceb2c7a94bf1e79afdf2b8d21a5700dadc9128')

prepare() {
  cd "amneziawg-linux-kernel-module-${pkgver}"
  patch -Np1 -i "${srcdir}/kernel-7.1.5-udp-tunnel.patch"
}

package() {
  depends+=("dkms")
  cd "amneziawg-linux-kernel-module-${pkgver}/src"
  make DESTDIR="${pkgdir}" dkms-install
}
