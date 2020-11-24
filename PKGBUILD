# Maintainer: sihuan <sihuan at sakuya.love>

pkgname=dingtalk-linux
pkgver=1.0.0
pkgrel=2
arch=('x86_64')
pkgdesc="May be the official Linux experimental version"
url="https://www.dingtalk.com/"
depends=('gconf' 'gtk3' 'nss')
license=('custom')
source=(
    "http://okapps.oukan.online/lroapps/deb-amd64/dingtalk-linux.deb"
)
sha512sums=('4f62d1c0aab15951e4ed3f98e9e622bdb09b6f050458a26215607b4f7141647097c96d9a32533dea2fdfa529ba4b71838de606c703feaf9938f289a3ee6fa6c6')

conflicts=('dingtalk-electron')

prepare() {
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
    mkdir -p "$pkgdir/opt/dingtalk-linux"
    cp -pr "$srcdir/opt/dingtalk-linux/"* "$pkgdir/opt/dingtalk-linux/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s ../../opt/dingtalk-linux/nw "$pkgdir/usr/bin/dingtalk-linux"

    install -Dm644 "$srcdir/usr/share/icons/dingtalk-linux.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dingtalk-linux.png"

    echo "[Desktop Entry]
Version=1.0.0-2
Encoding=UTF-8
Name=Dingtalk
Comment=Dingtalk for Linux
Exec=dingtalk-linux
Icon=dingtalk-linux
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
Name[zh_CN]=钉钉
Comment[zh_CN]=钉钉 for Linux
    " > "$srcdir/dingtalk.desktop"
    install -Dm644 "$srcdir/dingtalk.desktop" "$pkgdir/usr/share/applications/dingtalk-linux.desktop"
}
