# Maintainer: petrouil
pkgname=grok-bot
pkgver=0.16.0
pkgrel=1
pkgdesc='Grok Bot desktop agent'
arch=('x86_64')
url='https://cursor.com'
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray support')
makedepends=('dpkg')
options=('!strip')
source=("${pkgname}_${pkgver}.deb::https://downloads.cursor.com/sand/stable/076e9d4bf42abbfa576702aea18ddbc49d9d3ab5/linux/x64/Grok_Bot_${pkgver}.deb")
sha256sums=('99d8b396641941ba4b889a791e9306737b398c0c3934f63a9545430910192bcc')

prepare() {
    dpkg-deb -x "${pkgname}_${pkgver}.deb" "${srcdir}/deb"
}

package() {
    cp -a "${srcdir}/deb/." "${pkgdir}/"
    install -Dm644 "${srcdir}/deb/usr/share/icons/hicolor/1024x1024/apps/sand.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/sand.png"
    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 "${pkgdir}/opt/Grok Bot/chrome-sandbox"
    fi
}