# Maintainer: Ludvig <artemludvig79@gmail.com>

pkgname=superlauncher-mc
pkgver=1.4.0.8
pkgrel=1
pkgdesc="SuperLauncherMC — Advanced Minecraft launcher with mod and server support (new design release)"
arch=('x86_64')
url="https://github.com/ludvig2457/SuperLauncherMC"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'python-minecraft-launcher-lib'
    'python-requests'
    'python-psutil'
    'python-pypresence'
    'python-packaging'
    'python-tqdm'
    'python-random-username'
    'java-runtime'
)
source=(
    "$pkgname-$pkgver.tar.gz::file:///home/artem/Downloads/SuperLauncher/superlauncher-mc-$pkgver.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Добавляем шебанг для python3, если его нет
    if ! head -n 1 SuperLauncher.py | grep -q "#!/usr/bin/env python3"; then
        sed -i '1i#!/usr/bin/env python3' SuperLauncher.py
    fi

    # Основной исполняемый файл
    install -Dm755 SuperLauncher.py "$pkgdir/usr/bin/superlauncher-mc"

    # Ресурсы
    install -d "$pkgdir/usr/share/superlauncher-mc"
    cp -r assets "$pkgdir/usr/share/superlauncher-mc/"

    # Desktop-файл
    install -d "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/superlauncher-mc.desktop"
[Desktop Entry]
Name=SuperLauncherMC
Comment=Advanced Minecraft Launcher with mod and server support
Exec=/usr/bin/superlauncher-mc
Icon=superlauncher
Type=Application
Categories=Game;
Terminal=false
EOF

    # Иконка
    install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/superlauncher.png"
}
