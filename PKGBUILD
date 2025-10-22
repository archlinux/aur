# Maintainer: Kira Vogt <agsimmons0 at gmail dot com>
# Original template: Andrew Simmons <agsimmons0 at gmail dot com> (Splashtop Business) 

pkgname=splashtop-onprem-bin
pkgver=3.7.4.5
pkgrel=1
urlver=3360
pkgdesc="Splashtop On-Prem. Self-hosted on-premise remote access and remote support solution."
arch=('x86_64')
url="https://www.splashtop.com/downloads/on-prem"
license=('LicenseRef-Proprietary')
depends=('gcc-libs' 'glibc' 'keyutils' 'libcap' 'libpulse' 'libxcb' 'qt5-base' 'util-linux-libs' 'xcb-util-keysyms' 'xcb-util' 'xdotool' 'zlib')
optdepends=('bash-completion: Bash completion support')
provides=('splashtop-onprem')
options=('!strip')
install=${pkgname}.install
source=("https://download.splashtop.com/ste_v3/v${urlver}/EP/Splashtop_Client_v${pkgver}.deb")
md5sums=('33c96d2ef18cb33e9501e51611e16461')

prepare(){
    ar x Splashtop_Client_v${pkgver}.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

    # Move unit file to correct location
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mv "$pkgdir/etc/systemd/system/SRUsbOp.service" "$pkgdir/usr/lib/systemd/system/"
    rm -r "$pkgdir/etc/"

    mkdir -m 755 "$pkgdir/opt/splashtop-onprem/dump"
    mkdir -m 777 "$pkgdir/opt/splashtop-onprem/log"
}
