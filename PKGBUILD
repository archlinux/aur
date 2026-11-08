# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=tidra-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Keep every project you maintain up to date from one desktop app (prebuilt)"
arch=('x86_64')
url="https://github.com/yusifaliyevpro/tidra-app"
license=('AGPL-3.0-or-later')
depends=(
    cairo
    dbus
    gdk-pixbuf2
    git
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libappindicator
    libgcc
    libsoup3
    libx11
    libxi
    sh
    util-linux
    'webkit2gtk-4.1'
)
optdepends=(
    'org.freedesktop.secrets: store tokens in the desktop keyring'
    'nodejs: manage Node.js projects'
    'npm: manage npm projects'
    'pnpm: manage pnpm projects'
    'yarn: manage Yarn projects'
    'bun: manage Bun projects'
    'github-cli: import an existing GitHub CLI authentication token'
)
provides=("tidra=$pkgver")
conflicts=('tidra')
options=('!strip' '!debug')
source=("$pkgname-$pkgver-amd64.deb::$url/releases/download/v$pkgver/Tidra_${pkgver}_amd64.deb")
sha256sums=('ed59654dabd495f49f7abccd6752f1c26ba9eb39959ff3c1276013cb60a7fb7e')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -Dm755 usr/bin/tidra "$pkgdir/usr/bin/tidra"
    install -Dm644 usr/share/applications/Tidra.desktop \
        "$pkgdir/usr/share/applications/tidra.desktop"

    local size
    for size in 32 128; do
        install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/tidra.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/tidra.png"
    done
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/tidra.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/tidra.png"
}
