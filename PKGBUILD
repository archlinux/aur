pkgname=mcsr-launcher
pkgver=3.2.0
pkgrel=1
pkgdesc="Minecraft Speedrunning Launcher"
arch=('any')
url="https://github.com/MCSRLauncher/Launcher"
license=('GPL3')
depends=('java-runtime')
source=("https://github.com/MCSRLauncher/Launcher/releases/download/v${pkgver}/MCSRLauncher.jar")
sha256sums=('1a897d4d0f2fda1c7c33bbfde168d70fc81c8494e82f4ad7bb428ac1032e0624')

package() {
    # Install the jar
    install -Dm644 "$srcdir/MCSRLauncher.jar" "$pkgdir/usr/share/$pkgname/Launcher.jar"

    # Install icon
    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mcsr-launcher.png"

    # Install desktop entry
    install -Dm644 "$srcdir/mcsr-launcher.desktop" "$pkgdir/usr/share/applications/mcsr-launcher.desktop"

    # Install run script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/mcsr-launcher" <<'EOF'
#!/bin/sh
exec java -jar /usr/share/mcsr-launcher/Launcher.jar "$@"
EOF
}

