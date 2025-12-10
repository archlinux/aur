# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>
# Contributor:: Tab Fitts <tfitts [at] spryservers [dot] net>

pkgname=splashtop-business
pkgver=3.8.0.0
pkgrel=1
pkgdesc="Splashtop Business. Remotely access your desktop from any device from anywhere!"
arch=('x86_64')
url="https://www.splashtop.com/business"
license=('LicenseRef-Proprietary')
depends=('gcc-libs' 'glibc' 'keyutils' 'libcap' 'libpulse' 'libxcb' 'qt5-base' 'util-linux-libs' 'xcb-util-keysyms' 'xcb-util' 'xdotool' 'zlib')
optdepends=('bash-completion: Bash completion support')
provides=('splashtop-business')
options=('!strip')
install=${pkgname}.install
source=("https://download.splashtop.com/linuxclient/${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz")
sha256sums=('128f9b7fe6ab15e2089339f76f325abaa97ac3657fa71d09b1fe4e87daf8430e')

prepare(){
    ar x splashtop-business_Ubuntu_amd64.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

    # Disable SRUsb.service until it's clear what it's purpose is
    # Move unit file to correct location
    # mkdir -p "$pkgdir/usr/lib/systemd/system/"
    # mv "$pkgdir/etc/systemd/system/SRUsb.service" "$pkgdir/usr/lib/systemd/system/"
    rm -r "$pkgdir/etc/"

    mkdir -m 777 "$pkgdir/opt/splashtop-business/config"
    mkdir -m 755 "$pkgdir/opt/splashtop-business/dump"
    mkdir -m 777 "$pkgdir/opt/splashtop-business/log"
}
