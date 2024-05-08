# Maintainer: Kiwi42 <pullthisplug dash aur at yahoo dot com>

pkgname=threat-dragon-ng
pkgver=2.2.0
pkgrel=1
pkgdesc="Electron Threat Modelling and diagramming tool by Mike Goodwin @ OWASP"
arch=('x86_64')
url="https://owasp.org/www-project-threat-dragon/"
license=('Apache-2.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" owasp-threat-dragon)
depends=(alsa-lib cairo gtk3 hicolor-icon-theme libxkbcommon nspr nss pango)
options=(!debug)
source=("${pkgname}-${pkgver}.deb::https://github.com/OWASP/threat-dragon/releases/download/v${pkgver}/threat-dragon_2.2.0_amd64.deb")
sha256sums=('68eb24d3c67391ea9c20afd5efb72f50a3ed3aa73b9eada9936ae799345cb647')


package() {
    # extract data from debian package
    tar -xf data.tar.xz -C "${pkgdir}"

    # fix icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/threat-dragon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/threat-dragon.png"
    rm -r "${pkgdir}/usr/share/icons/hicolor/0x0"

    # create symlink to executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Threat-Dragon-ng/threat-dragon" "${pkgdir}/usr/bin/threat-dragon"
}
