# Maintainer: sihuan <sihuan at sakuya.love>

_pkgname=thenewplayerfree
pkgname=thenewplayerfree-bin
pkgver=1.6.6
pkgrel=3
arch=('x86_64')
pkgdesc="The best IPTV/vide/iso/blue-ray player for macOS and Linux"
url="https://github.com/sudormroot/thenewplayer_builds"
depends=('qt5-multimedia' 'libvdpau' 'libva' 'openjpeg2' 'hicolor-icon-theme')
license=('custom')
source=("https://github.com/sudormroot/thenewplayer_builds/releases/download/thenewplayerfree-bin.linux.dynamic-build.1.6.6-3.amd64/thenewplayerfree-bin.linux.dynamic-build.1.6.6-3.amd64.deb")
sha512sums=('2238d1ec9e2f41ef36cc05c838dd18b29ceac81f63c7c553819ceda2bebdf53e1210738139c9ec08b58134a2f23a11839f89c389249d42943c192aa52374b18c')


prepare() {
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {

    install -Dm755 "$srcdir/usr/local/thenewplayerfree/bin/thenewplayerfree" "$pkgdir/opt/$_pkgname/thenewplayerfree"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/thenewplayerfree" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/usr/local/thenewplayerfree/share/images/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

    mkdir -p "$pkgdir/opt/thenewplayerfree/languages/"
    install -Dm644 "$srcdir/usr/local/thenewplayerfree/share/languages/"* "$pkgdir/opt/$_pkgname/languages/"

    install -Dm644 "$srcdir/usr/local/thenewplayerfree/share/licenses/self/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    echo "[Desktop Entry]
Version=1.6.6
Encoding=UTF-8
Name=TheNewPlayerFree
Comment=The best IPTV/vide/iso/blue-ray player for macOS and Linux
Exec=thenewplayerfree
Icon=thenewplayerfree
Terminal=false
Type=Application
Categories=AudioVideo;Player;
Keywords=IPTV;Player;Movie;Video;
    " > "$srcdir/thenewplayerfree.desktop"
    install -Dm644 "$srcdir/thenewplayerfree.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}