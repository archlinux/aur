# Maintainer: Detrital <Detritalw@outlook.com>
pkgname=bloret-launcher
pkgver=27RC
pkgrel=1
pkgdesc="Be creative, be simple. Your Personal Innovative Open Source AI Minecraft Launcher. Relax, it's Bloret Launcher."
arch=('any')
url="https://github.com/BloretCrew/Bloret-Launcher"
license=('GPL-3.0-only')
depends=('python' 'pyside6' 'python-requests' 'python-psutil' 'python-dulwich' 'python-send2trash' 'python-toml' 'qt6-5compat' 'qt6-declarative')
makedepends=('git')
optdepends=('java-runtime: 运行 Minecraft 所需的 Java 环境')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/Bloret-Launcher-${pkgver}"

    _install_dir="${pkgdir}/usr/share/bloret-launcher"

    # 安装源码和数据文件
    install -Dm755 Bloret-Launcher.py "${_install_dir}/Bloret-Launcher.py"
    cp -r qml "${_install_dir}/qml"
    cp -r RinUI "${_install_dir}/RinUI"
    cp -r icon "${_install_dir}/icon"
    cp -r lang "${_install_dir}/lang"
    cp -r modules "${_install_dir}/modules"
    cp -r ui "${_install_dir}/ui"
    install -Dm644 config.json "${_install_dir}/config.json"
    install -Dm644 JavaWrapper.jar "${_install_dir}/JavaWrapper.jar"
    install -Dm644 Bloret.png "${_install_dir}/Bloret.png"
    install -Dm644 Bloret-Fluent.png "${_install_dir}/Bloret-Fluent.png"
    install -Dm644 bloret.ico "${_install_dir}/bloret.ico"
    install -Dm644 servers.dat "${_install_dir}/servers.dat" 2>/dev/null || true

    # 安装启动脚本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloret-launcher" <<EOF
#!/bin/sh
cd /usr/share/bloret-launcher
exec python Bloret-Launcher.py "\$@"
EOF

    # 安装图标
    install -Dm644 Bloret-Fluent.png "${pkgdir}/usr/share/pixmaps/bloret-launcher.png"

    # 安装桌面文件
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/bloret-launcher.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Bloret Launcher
GenericName=Minecraft Launcher
Comment=A Minecraft Launcher designed by BloretValley administrator.
Exec=bloret-launcher
Icon=bloret-launcher
Terminal=false
Categories=Game;
Keywords=minecraft;game;launcher;
EOF

    # 安装许可证
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
