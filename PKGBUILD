# Maintainer: sihuan <sihuan at sakuya.love>

pkgname=dingtalk-linux
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="May be the official Linux experimental version"
url="https://www.dingtalk.com/"
depends=('alsa-lib' 'gconf' 'glibc' 'gtk2' 'libxss' 'libxtst' 'nss')
license=('custom')
source=(
    "http://okapps.oukan.online/lroapps/deb-amd64/dingtalk_3.0.0_amd64.deb"
    "http://mirror.centos.org/centos/6/os/x86_64/Packages/pango-1.28.1-11.el6.x86_64.rpm"
)
sha512sums=('f765134ba1a67cc3346f1e3f833390ca7a3d7aadf0c9754e9a471873120256668a73fa5b0a853e3d2edfbf2cdae57a4c0248a65ef9b9da5c423828ce3572c9a9'
            'bd9d69d9ac21b13c79afa1a4daef1ed1597ce4ab8ba2ee9986c3a50770a6b8f25962d58c27912680f1ad983e5893821603d847e8ec23c0073c1c57403ba94a69')

conflicts=('dingtalk-electron')

prepare() {
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
    mkdir -p "$pkgdir/opt/dingtalk"
    cp -pr "$srcdir/opt/dingtalk/"* "$pkgdir/opt/dingtalk/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s ../../opt/dingtalk/nw "$pkgdir/usr/bin/dingtalk-linux"

    cd "$srcdir/usr/lib64"
    cp -pr libpangocairo-1.0.so.0 libpangoft2-1.0.so.0.2800.1 libpangoxft-1.0.so.0 libpango-1.0.so.0 libpangocairo-1.0.so.0.2800.1 libpangox-1.0.so.0 libpangoxft-1.0.so.0.2800.1 libpango-1.0.so.0.2800.1 libpangoft2-1.0.so.0 libpangox-1.0.so.0.2800.1 "$pkgdir/opt/dingtalk/lib"
     
    install -Dm644 "$srcdir/usr/share/icons/dingtalk.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dingtalk.png"

    echo "[Desktop Entry]
Version=1.0.0
Encoding=UTF-8
Name=Dingtalk
Comment=Dingtalk for Linux
Exec=dingtalk-linux
Icon=dingtalk
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
Name[zh_CN]=钉钉
Comment[zh_CN]=钉钉 for Linux
    " > "$srcdir/dingtalk.desktop"
    install -Dm644 "$srcdir/dingtalk.desktop" "$pkgdir/usr/share/applications/dingtalk.desktop"
}