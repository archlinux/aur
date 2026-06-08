# Maintainer: Kiwi42 <pullthisplug dash aur at yahoo dot com>

pkgname=threat-dragon-ng
pkgver=2.6.2
pkgrel=1
pkgdesc="Electron Threat Modelling and diagramming tool by Mike Goodwin @ OWASP"
arch=('x86_64')
url="https://owasp.org/www-project-threat-dragon/"
license=('Apache-2.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" owasp-threat-dragon)
depends=(alsa-lib cairo gtk3 hicolor-icon-theme libxkbcommon nspr nss pango)
options=(!debug)
source=("${pkgname}-${pkgver}.deb::https://github.com/OWASP/threat-dragon/releases/download/v${pkgver}/threat-dragon_${pkgver}_amd64.deb")
sha256sums=('cbb8e50b07a5a864a70ffe4d9c66b4938b778ce249c295249d86807618b2dda3')


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
