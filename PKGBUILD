pkgname=localbooru
pkgver=1.6.0
pkgrel=2
pkgdesc="A cross-platform local booru collection that works exclusively on local storage."
arch=('x86_64')
url="https://github.com/resucutie/localbooru"
license=('GPL-3.0')
depends=('bash')
source=("$pkgname-$pkgver.zip::https://github.com/resucutie/localbooru/releases/download/$pkgver/localbooru-linux-binaries.zip"
"icon.png")
sha256sums=("SKIP" "SKIP")

package() {
    # Create target directory
    install -d "$pkgdir/opt/localbooru"

    # Extract the content to /opt/localbooru
    cp -r "$srcdir"/* "$pkgdir/opt/localbooru"
    chmod +x "$pkgdir/opt/localbooru/localbooru"

    # Create the launcher script in /bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/localbooru" <<'EOF'
#!/bin/bash
/opt/localbooru/localbooru "$@"
EOF

    # icon
     install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/localbooru.png"


    # Create the desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/localbooru.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=LocalBooru
Exec=/usr/bin/localbooru
Icon=localbooru
Terminal=false
Categories=Graphics;Viewer;
Comment=Cross-platform local booru collection manager that works exclusively on local storage
EOF
}
