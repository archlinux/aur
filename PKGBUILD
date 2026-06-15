pkgname=hello-minecraft-launcher-dev-bin
pkgver=3.15.0.346
pkgrel=1
pkgdesc="HMCL is an open-source, cross-platform Minecraft launcher that supports Mod Management, Game Customizing, ModLoader Installing (Forge, NeoForge, Fabric, Quilt, LiteLoader, and OptiFine), Modpack Creating, UI Customization, and more."
arch=('any')
url="https://hmcl.huangyuhui.net"
license=('GPL3')
depends=('java-runtime' 'gtk2')
source=("${pkgname}.png"
        "${pkgname}-${pkgver}.jar::https://hmcl.glavo.site/download/HMCL-${pkgver}.jar")
sha256sums=('d4e56ae2e8c0d991dba01ef3124ef4d38918825f58728338a8bab5e78319306a'
            '1d63b28c1e9fddd586cac9afe5d26e4174bce2a952ef59b4e29b588e28a1dce7')


package() {
    install -d "$pkgdir/opt/$pkgname"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.jar" "$pkgdir/opt/$pkgname/hmcl.jar"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/hmcl" << EOF
#!/bin/sh
exec java -jar /opt/$pkgname/hmcl.jar "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/hmcl"

    install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=HMCL
Comment=Hello Minecraft! Launcher
Exec=hmcl
Icon=$pkgname
Terminal=false
Type=Application
Categories=Game;
EOF
}
