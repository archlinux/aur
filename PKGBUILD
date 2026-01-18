# Maintainer: Sevilze <sevilzcubing@gmail.com>
pkgname=llminxsolver-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Megaminx Last Layer Solver with Compose Multiplatform GUI"
arch=('x86_64')
url="https://github.com/Sevilze/llminxsolver-cmp"
license=('MIT')
depends=('java-runtime>=21' 'xdg-utils' 'hicolor-icon-theme')
provides=('llminxsolver')
conflicts=('llminxsolver')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/llminxsolver-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('5a2c918a2169c4ebe8577faab6125b9317162db2899c6f37dcfcb0f5d61b9ae3')

package() {
    cd "$srcdir"
    
    install -dm755 "$pkgdir/usr/share/llminxsolver"
    cp -r "LLMinx Solver/bin" "$pkgdir/usr/share/llminxsolver/"
    cp -r "LLMinx Solver/lib" "$pkgdir/usr/share/llminxsolver/"
    chmod 755 "$pkgdir/usr/share/llminxsolver/bin/LLMinx Solver"
    
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/llminxsolver" <<'EOF'
#!/bin/sh
exec "/usr/share/llminxsolver/bin/LLMinx Solver" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/llminxsolver"
    
    install -Dm644 "LLMinx Solver/lib/LLMinx Solver.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/llminxsolver.png"
    
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/llminxsolver.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=LLMinx Solver
Comment=Megaminx Last Layer Solver with Compose Multiplatform GUI
Exec=llminxsolver
Icon=llminxsolver
Categories=Utilities;
Terminal=false
EOF
}
