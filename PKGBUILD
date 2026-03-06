# Maintainer: Brendan Tildesley <you@example.com>

pkgname=zerene-stacker
pkgver=2024.11.18
pkgrel=1
pkgdesc="Zerene Stacker focus stacking software"
arch=('x86_64')
url="https://zerenesystems.com/"
license=('custom')
#depends=('java-runtime')
source=("https://zerenesystems.com/stacker/downloads/ZS-Linux-Intel-64bit-T2024-11-18-1210.zip"
       "ZereneStackerLogo_x2-128.png")
sha256sums=('9ccb4133a2f0e53419f5a0b41e6ac2d37b7b1e5e0d0c4f6f0d3601187c853c2e'
                    'afea1098f5c0b02ee1b717ea951d27601f759bae1f8979b8b2ca04d0f74cfaa3')

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/opt/$pkgname"

    cp -r ZereneStacker "$pkgdir/opt/$pkgname/"

    chmod +x "$pkgdir/opt/$pkgname/ZereneStacker/ZereneStacker.bsh"

    # launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/zerene-stacker" <<EOF
#!/usr/bin/env bash
exec /opt/$pkgname/ZereneStacker/ZereneStacker.bsh "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/zerene-stacker"
    
    # install icon
    
    install -Dm644 "ZereneStackerLogo_x2-128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/zerene-stacker.png"
    # desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/zerene-stacker.desktop" <<EOF
[Desktop Entry]
Name=Zerene Stacker
Exec=zerene-stacker
Icon=/usr/share/icons/hicolor/128x128/apps/zerene-stacker.png
#Icon=zerene-stacker
Type=Application
Categories=Graphics;Photography;
EOF
}
