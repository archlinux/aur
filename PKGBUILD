# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-gui-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="LianWall GUI - Qt6/QML graphical client for lianwalld wallpaper daemon"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall-gui"
license=('MIT')
depends=('lianwalld-bin' 'qt6-base' 'qt6-declarative' 'ffmpeg')
optdepends=('lianwall-bin: CLI client for lianwalld')
provides=('lianwall-gui')
conflicts=('lianwall-gui')
source=("lianwall-gui-${pkgver}::https://github.com/Yueosa/lianwall-gui/releases/download/v${pkgver}/lianwall-gui_${pkgver}_linux_x86_64"
        "lianwall.png::https://raw.githubusercontent.com/Yueosa/lianwall-gui/main/resources/icons/lianwall.png")
sha256sums=('5e8ced8ae5ac2cedf80427c0d52d777d53264794b54b00a39546e5db8750ad9a'
            'a0328df19674629349b2ba601d7b66f2863414a215585f33d856341b535f2011')

package() {
    install -Dm755 "lianwall-gui-${pkgver}" "$pkgdir/usr/bin/lianwall-gui"
    install -Dm644 "lianwall.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lianwall.png"

    # 生成 desktop 文件
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/lianwall-gui.desktop" << 'EOF'
[Desktop Entry]
Name=lianwall-gui
Name[zh_CN]=Lianwall 壁纸管理器
Comment=Wayland Dynamic Wallpaper Manager
Comment[zh_CN]=Wayland 动态壁纸管理器
GenericName=Wallpaper Manager
GenericName[zh_CN]=壁纸管理器
Exec=lianwall-gui
Icon=lianwall
Terminal=false
Type=Application
Categories=Utility;Settings;
Keywords=wallpaper;wayland;video;background;
StartupNotify=true
StartupWMClass=lianwall-gui
EOF
}
