# Maintainer: SoleilSaint
pkgname=ugee-wayland-bridge
pkgver=0.1.0
pkgrel=3
url='https://github.com/SaintFore/ugee-wayland-bridge'
pkgdesc='Process-local XTest to uinput keyboard bridge for the UGEE tablet driver'
arch=('x86_64')
license=('MIT')
depends=('ugee-tablet' 'libx11' 'util-linux' 'procps-ng' 'python')
source=('bridge.c::https://raw.githubusercontent.com/SaintFore/ugee-wayland-bridge/c19286bb79a5a1b724bc46cc4843d9e30eb161ee/bridge.c' 'ugee-tablet-wayland::https://raw.githubusercontent.com/SaintFore/ugee-wayland-bridge/c19286bb79a5a1b724bc46cc4843d9e30eb161ee/ugee-tablet-wayland' 'LICENSE::https://raw.githubusercontent.com/SaintFore/ugee-wayland-bridge/c19286bb79a5a1b724bc46cc4843d9e30eb161ee/LICENSE')
sha256sums=('ba0003b7763f99bbe58a8cc1f8e8e2b768a893fcac664e4585eb8a4667fdb82e' 'ba1ed0b586f4157ff709f442e12244df22ba1f057f65070eeed4050151050da9' '70697213fdfc5a5ef7d3dd08811bbddc612836c201c5ead38dbeae0d22d238d9')
options=('!debug')
build() {
    cc -std=c11 -Wall -Wextra -Werror -O2 -fPIC -shared bridge.c -o libugee-wayland.so -lX11 -ldl -pthread
}
package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 libugee-wayland.so "$pkgdir/usr/lib/ugee-wayland-bridge/libugee-wayland.so"
    install -Dm755 ugee-tablet-wayland "$pkgdir/usr/bin/ugee-tablet-wayland"
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/ugee-tablet-wayland.desktop" <<'EOF'
[Desktop Entry]
Name=UGEE Tablet (Wayland shortcuts)
Name[zh_CN]=UGEE 数位板（Wayland 快捷键）
Exec=/usr/bin/ugee-tablet-wayland
Icon=ugeetablet
Terminal=false
Type=Application
Categories=Settings;HardwareSettings;
EOF
}
