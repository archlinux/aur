# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Pippo Peppo <abc@gmx.ch>
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=7.0.6_50085
_pkgver=7.0.6-50085
pkgrel=1
pkgdesc="It helps you set up and install DSM on your DiskStation"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/Assistant"
license=('custom:Synology Linux License Grant')
depends=('glib2' 'glibc' 'qt5-base' 'libxkbcommon' 'libice' 'libsm')
conflicts=('synology-assistant')
provides=('synology-assistant')
install=${pkgname}.install
source=("https://global.download.synology.com/download/Utility/Assistant/${_pkgver}/Ubuntu/${arch}/synology-assistant_${_pkgver}_amd64.deb")
sha256sums=('b42082f9bbde5494171dad70dbb2675678a1b7a5c9b3af0c11900ee17b1b7122')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/SynologyAssistant/SynologyAssistant "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 usr/share/applications/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
