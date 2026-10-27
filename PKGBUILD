# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=grimoire-tui-bin
_pkgname=grimoire-tui
pkgver=0.7.5
pkgrel=1
pkgdesc='A terminal writing desk for novels'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/kelsierbot/GrimoireTUI'
license=('MIT')
debends=('playerctl')
optdepends=(
    'speech-dispatcher: For the voice feature'
    'espeak-ng: Another option for the voice feature'
)
options=(
    '!lto'
    '!debug'
)
provides=('grimoire')
conflicts=('grimoire-tui-git' 'grimoire-tui')
source=(
    "128x128-${pkgver}.png::https://raw.githubusercontent.com/kelsierbot/GrimoireTUI/refs/tags/v${pkgver}/apps/mobile/src-tauri/icons/128x128.png"
    "128x128@2x-${pkgver}.png::https://raw.githubusercontent.com/kelsierbot/GrimoireTUI/refs/tags/v${pkgver}/apps/mobile/src-tauri/icons/128x128@2x.png"
    'grimoire.desktop'
)
source_x86_64=("grimoire-tui-bin-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/grimoire-tui-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("grimoire-tui-bin-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/grimoire-tui-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=(
    '822bbe4af06f1a9a478c315331e0a6460b2524315ae476c64e6a76379982cc3b'
    '90b8a1d12316321e7aed2e3ee06e799a17601f86fa61f38cd67c49a11b5504c1'
    '9063f4253aaa32cac86665cee124f5388ce0c9efc8df7077a40566638b4a5aad'
)
sha256sums_x86_64=('95f7bcf9abbf097539d9db6dbf2b333d2f7fe6caaec3389af45130581b750c35')
sha256sums_aarch64=('a401b0b01bb83e9908a474280a2ef0683435405537a901be8e503e22ccbcc6eb')

package() {
    cd "grimoire-tui-${CARCH}-unknown-linux-gnu"
    install -Dm0755 grimoire "$pkgdir/usr/bin/grimoire"
    install -Dm644 ../128x128-"${pkgver}".png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/grimoire.png"
    install -Dm644 ../128x128@2x-"${pkgver}".png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/grimoire.png"

    install -Dm644 ../grimoire.desktop "$pkgdir/usr/share/applications/grimoire.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
