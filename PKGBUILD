pkgname=aspm
pkgver=1.12.6
pkgrel=1
pkgdesc="A secure private messenger"
arch=('x86_64')
url="https://github.com/fredima2x/aspm"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fredima2x/aspm/archive/v$pkgver.tar.gz")
sha256sums=('7d81f74410de79d8f449ec95cd7687f6c5d86ac0159492c897c72e18e5da703c')

package() {
    local src="$srcdir/$pkgname-$pkgver/client"  # ← client/ Unterordner!

    install -dm755 "$pkgdir/opt/aspm"
    cp -r "$src/." "$pkgdir/opt/aspm/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aspm" << 'EOF'
#!/bin/bash
exec python /opt/aspm/main.py "$@"
EOF

    # Desktop-Eintrag
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/aspm.desktop" << 'EOF'
[Desktop Entry]
Name=ASPM
Comment=A secure private messenger
Exec=aspm
Icon=/opt/aspm/assets/logo.png
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF
}
