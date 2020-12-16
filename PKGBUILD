# Maintainer: sihuan <sihuan at sakuya.love>

pkgname=dingtalk-linux
pkgver=3.5.5
pkgrel=1
arch=('x86_64')
pkgdesc="May be the official Linux experimental version"
url="https://www.dingtalk.com/"
depends=('alsa-lib' 'gconf' 'glibc' 'gtk2' 'libxss' 'libxtst' 'nss')
license=('custom')
source=(
    "http://okapps.oukan.online/lroapps/deb-amd64/dingtalk_3.5.5-Beta.0_amd64.deb"
    "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/16/Everything/x86_64/os/Packages/pango-1.29.4-1.fc16.x86_64.rpm"
)
sha512sums=('df56f0179e384e9876e6d322fe27ea9cb86b20c82cfc20b06c2493a8f9c9a24c38fbd9d3967a28b61a5290ba3c7d9014418a0213142f602f41d088bf98fa40a9'
            '78ae60eae5785c3a7a00694ffab2fec40960e6f5f844c6cfb10650a7762962a8a68b1866914e7045831d2f6ed2fcdb05b0bed893e0bc24cfeb920b7520bb5043')


prepare() {
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
    mkdir -p "$pkgdir/opt/dingtalk"
    cp -pr "$srcdir/opt/dingtalk/"* "$pkgdir/opt/dingtalk/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s ../../opt/dingtalk/nw "$pkgdir/usr/bin/dingtalk-linux"

    cd "$srcdir/usr/lib64"
    cp -pr libpangocairo-1.0.so.0 libpangoft2-1.0.so.0.2904.0 libpangoxft-1.0.so.0 libpango-1.0.so.0 libpangocairo-1.0.so.0.2904.0 libpangox-1.0.so.0 libpangoxft-1.0.so.0.2904.0 libpango-1.0.so.0.2904.0 libpangoft2-1.0.so.0 libpangox-1.0.so.0.2904.0 "$pkgdir/opt/dingtalk/lib"

    for size in "16x16" "24x24" "32x32" "48x48" "64x64" "96x96" "128x128" "256x256" "512x512"
    do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/$size/apps/dingtalk.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/dingtalk-linux.png"
    done

    echo "[Desktop Entry]
Version=3.5.5
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
