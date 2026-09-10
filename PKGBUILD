# Maintainer: Kritiqual
pkgname=neovide-nightly-bin
pkgver=nightly.r25.gade2d9c
pkgrel=1
pkgdesc='No Nonsense Neovim Client in Rust (nightly build)'
arch=('x86_64')
url='https://github.com/neovide/neovide'
license=('MIT')
options=('!strip')

depends=(
    'fontconfig'
    'gcc-libs'
    'glibc'
    'neovim'
)

optdepends=(
    'libxkbcommon-x11: X11 support'
)

provides=('neovide')
conflicts=('neovide')

source=(
    'neovide-linux-x86_64.tar.gz::https://github.com/neovide/neovide/releases/download/nightly/neovide-linux-x86_64.tar.gz'
    'neovide.desktop::https://raw.githubusercontent.com/neovide/neovide/nightly/assets/neovide.desktop'
    'neovide.svg::https://raw.githubusercontent.com/neovide/neovide/nightly/assets/neovide.svg'
    'LICENSE::https://raw.githubusercontent.com/neovide/neovide/nightly/LICENSE'
)

sha256sums=('8acc3aca8807e546ae1e49fb6393b0b768b67c132679d25bf59b3c19981326a9'
            '028fe24eee4a367dfba9cb223725055da327b1c261325cc33049192ca0fdd2f8'
            'a6870391ded090cc5f24f0cb40a8ffa67930faf109a419753ec25ac0a03177a9'
            '60c7b5e1d0b3daee2f2a504d622e47ca37f45e61bb2538a2a10e1c5555da1dd7')

prepare() {
    tar -xzf neovide-linux-x86_64.tar.gz
}

check() {
    ./neovide --version
}

package() {
    install -Dm755 neovide \
        "$pkgdir/usr/bin/neovide"

    install -Dm644 neovide.desktop \
        "$pkgdir/usr/share/applications/neovide.desktop"

    install -Dm644 neovide.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/neovide.svg"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
