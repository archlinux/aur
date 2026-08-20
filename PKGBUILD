# Maintainer: petrouil
pkgname=grok-bot
pkgver=0.20.0
pkgrel=1
pkgdesc='Grok Bot desktop agent'
arch=('x86_64')
url='https://cursor.com'
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray support')
makedepends=('dpkg')
options=('!strip')
source=("${pkgname}_${pkgver}.deb::https://downloads.cursor.com/grokbot/stable/ca2c2b6f79b6130a4822d8189711b0f79f9d4661/linux/x64/Grok_Bot_${pkgver}.deb")
sha256sums=('67a6eb6164ab233a5c5d4d50665efada2cbaae9f22efade85e934a65fdfbb20d')

prepare() {
    rm -rf "${srcdir}/deb"
    dpkg-deb -x "${pkgname}_${pkgver}.deb" "${srcdir}/deb"
}

package() {
    cp -a "${srcdir}/deb/." "${pkgdir}/"
    install -Dm644 "${srcdir}/deb/usr/share/icons/hicolor/1024x1024/apps/grok-bot.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/grok-bot.png"
    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 "${pkgdir}/opt/Grok Bot/chrome-sandbox"
    fi
}