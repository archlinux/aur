# Maintainer: Tenshii <tenshii@miwa.lol>
pkgname=deezer-discord-rpc-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A Discord RPC for Deezer"
arch=('x86_64')
url="https://github.com/CuteTenshii/deezer-discord-rpc"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'mesa' 'xdg-utils')
source=("https://github.com/CuteTenshii/deezer-discord-rpc/releases/latest/download/DeezerDiscordRPC-linux-amd64.deb")
md5sums=("951e8e4c159143baa100b3b4f68c9b99")
sha256sums=("e9b40f121092bacd879326b984c91d2286d3e2cd353dc450706d19418cc4582b")

package() {
    # Extract the .deb file
    bsdtar -xf "DeezerDiscordRPC-linux-amd64.deb" -C "$srcdir"

    # Extract the data tarball
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    # pacman handles updates, so the app's own update check is turned off.
    # The .desktop entry is the only launcher, as the .deb's postinst symlink is not recreated.
    sed -Ei 's#^Exec=("[^"]*"|[^ ]*)#& --disable-updates#' "$pkgdir/usr/share/applications/deezer-discord-rpc.desktop"
}