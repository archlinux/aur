
# Maintainer: Alberto Gutiérrez Torre <agutierrez@posteo.net>

pkgname=cargo-bay-2000
pkgver=0.1
pkgrel=4
pkgdesc="Move boxes, push buttons, change gravity and open that damn door!

In Cargo Bay 2000 you control a maintenance robot that must properly place all the wooden crates from the future(TM) in more than 30 different hand-crafted levels (34, exactly!). To do that you must push boxes, open and close platforms by using pressure plates or keycards and control the gravity for the ultimate box sorting journey!"
arch=('x86_64')
url="https://theisolinearchip.itch.io/cargo-bay-2000"
license=('freeware')
depends=('glibc')
options=('!debug' '!strip')

source=(
    "cargobay2000_v01_linux.zip::https://albertgonzalez.coffee/packages/cargo_bay_2000/cargobay2000_v01_linux.zip"
)

sha256sums=(
    '5b959d99c450f85405a97e9753884112a0522ec2c74c0ebc4ae079a1f4c19b03'
)

package() {
    local gamedir="/opt/cargo-bay-2000"

    # Install game files
    install -dm755 "$pkgdir$gamedir"
    cp -a "$srcdir/cargobay2000_v01_linux/." "$pkgdir$gamedir/"

    # Ensure executable permissions
    chmod 755 "$pkgdir$gamedir/cargobay2000"

    # Install launcher
    install -dm755 "$pkgdir/usr/bin"

    cat > "$pkgdir/usr/bin/cargo-bay-2000" <<'EOF'
#!/bin/sh
cd /opt/cargo-bay-2000 || exit 1
exec ./cargobay2000 "$@"
EOF

    chmod 755 "$pkgdir/usr/bin/cargo-bay-2000"

    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications"

    cat > "$pkgdir/usr/share/applications/cargo-bay-2000.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cargo Bay 2000
Comment=Cargo Bay 2000
Exec=cargo-bay-2000
Terminal=false
Categories=Game;
EOF
}

