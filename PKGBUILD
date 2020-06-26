# Maintainer: sihuan <sihuan at sakuya.love>

_pkgname=thenewplayerfree
pkgname=thenewplayerfree-bin
pkgver=1.6.1
pkgrel=2
arch=('x86_64')
pkgdesc="The best video/streaming media player under UNIX"
url="https://github.com/sudormroot/thenewplayer_builds"
depends=('qt5-base' 'qt5-multimedia')
license=('unknown')
source=("https://github.com/sudormroot/thenewplayer_builds/releases/download/tnpfree_v1_6_1_amd64_linux/thenewplayerfree_linux_1.6.1-1_all.deb")
sha512sums=('d1c694013fdda6b4482ce10164bba0e60e6ab3d5a2e55b3d2f061c6e558da91df6e0ee22e1981873bdf10029f1ad6eddb84106d58152167af6a9995e8090bc8f')


prepare() {
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {

    install -Dm755 "$srcdir/usr/local/thenewplayerfree/bin/thenewplayerfree" "$pkgdir/opt/thenewplayerfree/bin/thenewplayerfree"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgdir/opt/thenewplayerfree/bin/thenewplayerfree" "$pkgdir/usr/bin/thenewplayerfree"

    install -Dm644 "$srcdir/usr/local/thenewplayerfree/images/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/thenewplayerfree.png"

    mkdir -p "$pkgdir/opt/thenewplayerfree/languages/"
    install -Dm644 "$srcdir/usr/local/thenewplayerfree/languages/"* "$pkgdir/opt/thenewplayerfree/languages/"
    ln -s "$pkgdir/opt/thenewplayerfree/languages/" "$pkgdir/opt/thenewplayerfree/bin/"

    echo "[Desktop Entry]
Version=1.6.1
Encoding=UTF-8
Name=TheNewPlayerFree
Comment=The best video/streaming media player under UNIX
Exec=thenewplayerfree
Icon=thenewplayerfree
Terminal=false
Type=Application
Categories=AudioVideo;Player;
Keywords=IPTV;Player;Movie;Video;
    " > "$srcdir/thenewplayerfree.desktop"
    install -Dm644 "$srcdir/thenewplayerfree.desktop" "$pkgdir/usr/share/applications/thenewplayerfree.desktop"
}