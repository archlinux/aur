# Maintainer: aurora <aurora@example.com>
pkgname=anich
pkgver=1.5.25
pkgrel=1
pkgdesc='一个支持超分辨率的在线动漫弹幕APP。多平台，多番剧源，多弹幕，高清无广告。追番看番必备软件。'
arch=('x86_64')
url='https://github.com/Sle2p/AniCh'
license=('unknown')
depends=('gtk3' 'mpv')
optdepends=('libappindicator-gtk3: tray icon support')
conflicts=('anich-bin' 'anich-app-bin')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://github.com/Sle2p/AniCh/releases/download/${pkgver}/anich-linux-${pkgver}.zip")
sha256sums=('d3d9c7f054f450d9a6cfca5c6018aecb88ad101b21729adf6c5efdfb629674df')

package() {
    # 安装二进制包到 /opt/anich
    install -dm755 "${pkgdir}/opt/anich"
    cp -a "${srcdir}/anich" "${pkgdir}/opt/anich/"
    cp -a "${srcdir}/data" "${pkgdir}/opt/anich/"
    cp -a "${srcdir}/lib" "${pkgdir}/opt/anich/"

    # 设置可执行权限
    chmod +x "${pkgdir}/opt/anich/anich"

    # 创建符号链接到 /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/anich/anich "${pkgdir}/usr/bin/anich"

    # 桌面入口文件
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/anich.desktop" <<EOF
[Desktop Entry]
Name=AniCh
Comment=一个支持超分辨率的在线动漫弹幕APP
Exec=/opt/anich/anich %U
Icon=anich
Terminal=false
Type=Application
Categories=AudioVideo;Video;Player;
StartupWMClass=anich
EOF

    # 安装图标
    install -Dm644 "${pkgdir}/opt/anich/data/flutter_assets/assets/images/icon.png" \
        "${pkgdir}/usr/share/pixmaps/anich.png"
}
