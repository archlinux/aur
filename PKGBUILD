# Maintainer: slyfox1186 <jhollis.ga at gmail dot com>

pkgname=grok-bot-desktop
_debname=grok-bot
pkgver=0.68.1
pkgrel=1
_commit=33103062f95061ccf9c81c5b365d37ab152c3b66
pkgdesc='Desktop agent app from xAI (official .deb, app files unmodified)'
arch=('x86_64')
url='https://x.ai/bot'
license=('LicenseRef-Proprietary')
depends=(
    alsa-lib
    at-spi2-core
    cairo
    dbus
    expat
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libcups
    libdrm
    libgcc
    libnotify
    libsecret
    libstdc++
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxrandr
    libxss
    libxtst
    mesa
    nspr
    nss
    pango
    systemd-libs
    util-linux-libs
    xdg-utils
)
optdepends=('libappindicator: tray icon (GNOME also needs the AppIndicator extension)')
provides=('grok-bot' 'sand')
conflicts=('grok-bot' 'sand' 'grok-bot-bin' 'grokbot-linux-port' 'grokbot-linux-port-bin')
options=('!strip' '!debug')
install=${pkgname}.install
source=("${_debname}_${pkgver}_amd64.deb::https://downloads.cursor.com/grokbot/stable/${_commit}/linux/x64/${_debname}_${pkgver}_amd64.deb")
sha256sums=('b2be8106d2b3eae07d983d5f1ca77b657accde666dc440db2a409421ecff3359')
noextract=("${_debname}_${pkgver}_amd64.deb")

package() {
    bsdtar -O -xf "${_debname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # The Debian postinst creates this link; pacman does not run postinst.
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/Grok Bot/grok-bot" "${pkgdir}/usr/bin/grok-bot"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/Grok Bot/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/Grok Bot/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
