# Maintainer: Tenshii <tenshii@miwa.lol>
pkgname=deezer-discord-rpc-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A Discord RPC for Deezer"
arch=('x86_64')
url="https://github.com/CuteTenshii/deezer-discord-rpc"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'mesa' 'xdg-utils')
source=("deezer-discord-rpc-1.5.1.deb::https://github.com/CuteTenshii/deezer-discord-rpc/releases/download/1.5.1/DeezerDiscordRPC-linux-amd64.deb")
md5sums=("acc2016a22a2d855218ea07935ec17c8")
sha256sums=("e51b4bc9d948b7b6407d0c281f99f1ca8bfdae7d5285c7c040a5d81bb66def5f")

package() {
    # Extract the .deb file
    bsdtar -xf "deezer-discord-rpc-1.5.1.deb" -C "$srcdir"

    # Extract the data tarball
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    # pacman handles updates, so the app's own update check is turned off.
    # The .desktop entry is the only launcher, as the .deb's postinst symlink is not recreated.
    sed -Ei 's#^Exec=("[^"]*"|[^ ]*)#& --disable-updates#' "$pkgdir/usr/share/applications/deezer-discord-rpc.desktop"
}