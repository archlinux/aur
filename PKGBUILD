# Maintainer: Mahmoud Almezali

pkgname=pkger-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Package manager for Arch Linux and Arch-based distributions'
arch=('x86_64')
url='https://github.com/almezali/pkger-g'
license=('MIT')
depends=('gtk4')
optdepends=('yay: AUR package support' 'paru: AUR package support' 'flatpak: Flatpak package support')
provides=('pkger')
conflicts=('pkger')

_source_url='https://gitlab.com/package-installer-gui/pkger/-/raw/main/pkger.tar.xz'
source=("pkger.tar.xz::${_source_url}")
sha256sums=('a03d35ad7299a36d7c58dc7b4ac5807a10ddd0f2731f929c19e4d05afcdac45c')

prepare() {
    cd "$srcdir"

    # The upstream archive contains these files at its root.
    for required in pkger pkger.desktop pkger.png README.txt; do
        if [[ ! -e "$required" ]]; then
            printf 'Error: required file is missing from the archive: %s\n' "$required" >&2
            return 1
        fi
    done

    chmod 755 pkger
    chmod 644 pkger.desktop pkger.png README.txt
}

package() {
    cd "$srcdir"

    install -Dm755 pkger "$pkgdir/usr/bin/pkger"
    install -Dm644 pkger.desktop "$pkgdir/usr/share/applications/pkger.desktop"
    install -Dm644 pkger.png "$pkgdir/usr/share/pixmaps/pkger.png"
    install -Dm644 README.txt "$pkgdir/usr/share/doc/pkger/README.txt"
}

# vim:set ts=4 sw=4 et:
