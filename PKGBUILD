# Maintainer: Cabel <mxzcabel at proton dot me>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.17.2
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('libxml2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('c40e7a8f7f9aa292c342b1ee653ea02ae513da59935b7048a600570993aab2da')
sha256sums_i686=('b18bdb973bd1f2cd054bb3118d55d0259e1b519a2c7731c72ce4c5beea439c23')
sha256sums_armv7h=('475c77ed3cfb77684ea815455a520e8ba0ea8bd96973cbf3f3f90b8cbd519ddc')
sha256sums_aarch64=('2433548d57f2cc61f5b3a8019e26b161eb89ff8e90df59a458f328a77f6792e3')

# There is also ArmEABI architecture for android devices available. Download with:
# https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.17.2_armel.deb

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
