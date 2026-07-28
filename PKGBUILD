# Maintainer: YesPlayMusic contributors

pkgname=yesplaymusic-axuanran-bin
pkgver=0.1.1_alpha.4
pkgrel=1
_releasever=0.1.1-alpha.4
pkgdesc="A third-party Netease Cloud Music player"
arch=('x86_64')
url="https://github.com/axuanran/YesPlayMusic"
license=('MIT')
provides=('yesplaymusic')
conflicts=(
    'yesplaymusic'
    'yesplaymusic-bin'
    'yesplaymusic-electron'
    'yesplaymusic-git'
)
depends=(
    'alsa-lib'
    'gtk3'
    'libxss'
    'nss'
)
optdepends=(
    'libnotify: desktop notifications'
    'libayatana-appindicator: system tray support'
    'xdg-utils: open URLs with default browser'
)
options=('!strip' '!debug')
source=(
    "YesPlayMusic-${_releasever}.pacman::${url}/releases/download/v${_releasever}/YesPlayMusic-${_releasever}.pacman"
    "LICENSE-${_releasever}::https://raw.githubusercontent.com/axuanran/YesPlayMusic/v${_releasever}/LICENSE"
)
sha256sums=('e3cbb71c715123138ff1c6ca42e033e44a82bfa88c523ebd41bd6047f81c62dc'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')

package() {
    tar -xf "YesPlayMusic-${_releasever}.pacman" -C "$pkgdir"

    rm -f "$pkgdir"/.{PKGINFO,MTREE,INSTALL}

    install -dm755 "$pkgdir/usr/bin"
    ln -sf '/opt/YesPlayMusic/yesplaymusic' "$pkgdir/usr/bin/yesplaymusic"

    chmod 4755 "$pkgdir/opt/YesPlayMusic/chrome-sandbox"

    sed -i 's|Categories=Music;|Categories=Music;AudioVideo;Player;|' \
        "$pkgdir/usr/share/applications/yesplaymusic.desktop"

    install -Dm644 "$srcdir/LICENSE-${_releasever}" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
