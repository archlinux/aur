# Maintainer: YesPlayMusic contributors

pkgname=yesplaymusic-axuanran-bin
pkgver=0.1.1_alpha.14
pkgrel=1
_releasever=0.1.1-alpha.14
pkgdesc="XuMP - a third-party Netease Cloud Music player"
arch=('x86_64')
url="https://github.com/axuanran/YesPlayMusic"
license=('MIT')
provides=('xump')
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
    "XuMP-${_releasever}.pacman::${url}/releases/download/v${_releasever}/XuMP-${_releasever}.pacman"
    "LICENSE-${_releasever}::https://raw.githubusercontent.com/axuanran/YesPlayMusic/v${_releasever}/LICENSE"
)
sha256sums=('81787ae5f89cf6313c70427229f6a83761ffebd898c91bccf4298676ab074376'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')

package() {
    tar -xf "XuMP-${_releasever}.pacman" -C "$pkgdir"

    rm -f "$pkgdir"/.{PKGINFO,MTREE,INSTALL}

    install -dm755 "$pkgdir/usr/bin"
    ln -sf '/opt/XuMP/xump' "$pkgdir/usr/bin/xump"

    chmod 4755 "$pkgdir/opt/XuMP/chrome-sandbox"

    install -Dm644 "$srcdir/LICENSE-${_releasever}" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
