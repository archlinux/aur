# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.15.2
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('libxml2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('5177ce7679d4b4d68eada63bb13bc8f28bff216f31e29ca09e57c8bea55bc53c')
sha256sums_i686=('80e06e2235e35b5b5cdc33645d13d21bee04f0dccf022cf6edf89d6163fedf5e')
sha256sums_armv7h=('5c256a2e334ec5321c5efa1999b74bdc12d68bcaa950ee220b2516938abee71c')
sha256sums_aarch64=('3e1f943feac939ff2f86916255f2e0e3613dce3b27f11884368195d8c0fc7889')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
