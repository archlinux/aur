# Maintainer: Pippo Peppo <abc@gmx.ch>
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=7.0.3_50049
pkgrel=1
pkgdesc="Synology Assistant is a desktop utility that searches for Synology servers within the local area network. It allows you to search and connect to your Synology server or set up Wake on LAN (WOL)."
arch=('i686' 'x86_64')
url="https://www.synology.com/releaseNote/Assistant"
license=('unknown')
install=synology-assistant.install
depends=('qt5-base' 'libpng12')
source_x86_64=(https://global.download.synology.com/download/Utility/Assistant/${pkgver//_/-}/Ubuntu/x86_64/synology-assistant_${pkgver//_/-}_amd64.deb)
source_i686=(https://global.download.synology.com/download/Utility/Assistant/${pkgver//_/-}/Ubuntu/i686/synology-assistant_${pkgver//_/-}_i386.deb)
md5sums_i686=('eba2faf735088ae9a1ec93c5dff431c2')
md5sums_x86_64=('b80f589f61a48c519ee387f93dca122f')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/SynologyAssistant/SynologyAssistant "${pkgdir}/usr/bin/synology-assistant"

    install -Dm644 usr/share/applications/synology-assistant.desktop "${pkgdir}/usr/share/applications/synology-assistant.desktop"
}
