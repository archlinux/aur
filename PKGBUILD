# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Pippo Peppo <abc@gmx.ch>
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=7.0.5_50070
_pkgver=7.0.5-50070
pkgrel=2
pkgdesc="It helps you set up and install DSM on your DiskStation"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/Assistant"
license=('custom:Synology Linux License Grant')
install=${pkgname}.install
depends=('libpng12' 'libxrender' 'libxt' 'libxext' 'fontconfig')
source=("https://global.download.synology.com/download/Utility/Assistant/${_pkgver}/Ubuntu/${arch}/synology-assistant_${_pkgver}_amd64.deb")
sha256sums=('48e65e53a3b7f8e7ed7816c353f2b0ba3b2e7583186608c57342fe1264286361')

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
