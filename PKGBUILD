# Maintainer: Ash <xash at riseup d0t net>
pkgname=xenia-canary
pkgver=$(curl -s "https://api.github.com/repos/xenia-canary/xenia-canary-releases/releases" | jq -r '[.[] | select(any(.assets[]; .name == "xenia_canary_linux.tar.gz"))][0].name | sub("_canary_experimental"; "")')
pkgrel=1
pkgdesc="Xbox 360 Emulator - Latest release from GitHub"
arch=('x86_64')
url="https://github.com/xenia-canary/xenia-canary-releases"
provides=('xenia_canary')
license=('custom')
depends=('tar')
_target="xenia_canary_linux.tar.gz"
makedepends=('wget' 'jq' 'tar' 'file')
source=(
    "https://github.com/xenia-canary/xenia-canary-releases/releases/download/$pkgver/$_target"
    "xenia-canary.desktop"
    "xenia-canary.png"
)
sha256sums=('SKIP'
            'bc80585ab3487ae68d359a7d73fea7b5247b893592c5c71b2b1f4310d1ae7ef8'
            '3be4e926fe5fd5acfd2d70a5d76c2554dae45f6de75a328f0285cabbee13161a')

prepare() {
    tar -xvf xenia_canary_linux.tar.gz
}

package() {
    install -Dm755 xenia_canary "${pkgdir}/usr/bin/xenia_canary"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 xenia-canary.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xenia-canary.png"
    install -Dm644 xenia-canary.desktop "${pkgdir}/usr/share/applications/xenia-canary.desktop"
}