# Maintainer: syhanjin <syhanjin666@gmail.com>
pkgname=dm-tool-bin
pkgver=2.1.5.3
pkgrel=1
pkgdesc="达妙电机上位机工具"
arch=('x86_64')
url="https://gitee.com/kit-miao/dm-tools"
license=('custom')
options=('!debug' '!strip')
depends=()
makedepends=()
provides=("dm-tool")
source=(
    "https://github.com/syhanjin/dm-tool-releases/releases/download/v${pkgver}/DMTool.v${pkgver}-x86_64.AppImage"
    "send.png"
)
sha256sums=(
    '1dbcd3b642f8a771453b4080523a712b421257c6f3c1ebf3f356c2551ba669c0'
    'a0e2a0eef89c95bd8c6736ec58ada0271be4843d444590c2c0b07ca079c6699f'
)
_appimage="DMTool.v${pkgver}-x86_64.AppImage"

prepare() {
    chmod +x "${_appimage}"
}

package() {
    # 安装 AppImage
    install -Dm755 "$srcdir/${_appimage}" "$pkgdir/opt/dm-tool/DMTool"

    # 安装桌面文件
    install -Dm644 <(cat <<EOF
[Desktop Entry]
Name=DMTool
Exec=/opt/dm-tool/DMTool
Icon=dm-tool
Type=Application
Categories=Utility;
EOF
) "$pkgdir/usr/share/applications/dm-tool.desktop"

    # 安装图标到标准位置
    install -Dm644 "$srcdir/send.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/dm-tool.png"
}
