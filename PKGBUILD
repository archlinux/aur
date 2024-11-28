# Maintainer: Cabel <mxzcabel at proton dot me>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.19.2
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'armeabi')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('libxml2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_arm64.deb")
source_armeabi=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armel.deb")
sha256sums_x86_64=('57c48cf7543e0c97a5ac4122a5c9f0237040be9badefd535dd4f74f2eead8ccc')
sha256sums_i686=('ad5c637b37143bbc1f3adbd85641c6e7dc22f46c51b53e33303901f3c0d0b578')
sha256sums_armv7h=('9d034f0410c52d2f91d8c2ef5b015bbe578176d9bf6db54d75558dbe873a337b')
sha256sums_aarch64=('bf4be8c0aada97142808d430334d5e270b44baf1a755c65f6ad40bc0bafc3a36')
sha256sums_armeabi=('1f6ee868ba4d20ffcb069c080c44881479b76f0101905e39894c4cff81166b1d')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
