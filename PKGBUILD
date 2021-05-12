# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.9.3_1
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
sha256sums_x86_64=('d0b8526534346236f9752387fa72bde048f9ffee42a09fcbb2b8707756adfa67')
sha256sums_i686=('2f2f954cd81454049bde774fbe82b4953f44f2cb241d3ec5ac464362bc8fbe15')
sha256sums_armv7h=('8334684913dae3962973cc73070eb5479b47ed727750fa7604312926b82aeede')
sha256sums_aarch64=('d5bbd129eb16fb9c7e6e104d7024cbd9cc990c524459bbab7851ba98ee2933cd')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
