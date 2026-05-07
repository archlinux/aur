# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Pippo Peppo <abc@gmx.ch>
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=7.0.7_50095
_pkgver=7.0.7-50095
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
sha256sums=('179b65691619a3c54bcf7dad9dd3af5474a8c337ebce7d0af3416dd13b85cfc6')

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
