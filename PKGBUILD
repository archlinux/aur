pkgname=lianpkg-gui-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="Flutter GUI for LianPkg — Wallpaper Engine resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'flutter' 'gui')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('gtk3' 'glibc')
optdepends=('lianpkg-bin: CLI version')

source=("lianpkg-gui-${pkgver}.tar.gz::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg-gui_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('d35ab37191e8fc7367e90baae15e8d4a172187cf5132d3486227ef362834b7f5')

package() {
  # 安装 bundle 到 /opt/lianpkg-gui
  install -d "$pkgdir/opt/lianpkg-gui"
  cp -a "$srcdir"/{lianpkg-gui,lib,data} "$pkgdir/opt/lianpkg-gui/"
  chmod 755 "$pkgdir/opt/lianpkg-gui/lianpkg-gui"

  # 创建 /usr/bin 符号链接
  install -d "$pkgdir/usr/bin"
  ln -s /opt/lianpkg-gui/lianpkg-gui "$pkgdir/usr/bin/lianpkg-gui"

  # 安装图标
  install -Dm644 "$srcdir/data/flutter_assets/assets/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/lianpkg-gui.png"

  # 安装 .desktop 文件
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/lianpkg-gui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=LianPkg GUI
GenericName=Wallpaper Engine Resource Tool
Comment=Extract, unpack and convert Wallpaper Engine resources
Exec=lianpkg-gui
Icon=lianpkg-gui
Terminal=false
Categories=Utility;Graphics;
Keywords=wallpaper;engine;pkg;tex;steam;
EOF
}
