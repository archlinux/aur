# Maintainer: Sevilze <sevilzcubing@gmail.com>
pkgname=llminxsolver-bin
pkgver=1.1.0
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
sha256sums=('0f3f981761f25591e5bc4c83161dd6b891765132ebfd66ae25960acf024312d8')

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
