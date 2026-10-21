# Maintainer: Cabel <mxzcabel at tuta dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=6.0.1
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'armeabi')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_arm64.deb")
source_armeabi=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armel.deb")
sha256sums_x86_64=('49843eccf3477cb6a95fda9731835c21af88b6d7a5d0492fb98177d6fb03a779')
sha256sums_i686=('f9ba2a5cd85d4bce89a2f1a62df134fbede5e3adee06a355d946d6e98448e327')
sha256sums_armv7h=('782a62f5fda08c2b84056a6ef217fe5a520450bffacf76e9a055c7352b4e745a')
sha256sums_aarch64=('eeefa0832c1b67c873bdb1c69ca54ce5eba76443ad4fac81b91d7efe816ddd9a')
sha256sums_armeabi=('84851b58e923d42b38fba4e9f3705db3d9ac20929c1b223563bcfc30511e5240')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    chmod 750 "${pkgdir}/var/lib/nordvpn/"
    chmod 750 "${pkgdir}/var/lib/nordvpn/data/"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
