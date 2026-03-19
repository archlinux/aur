# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=kittenspaceagency-bin
pkgver=2026.3.7.3848
pkgrel=1
epoch=
pkgdesc="Kitten Space Agency - EXPERIMENTAL"
arch=('x86_64')
url="https://ksa-linux.ahwoo.com"
license=('custom')
groups=()
depends=('glibc' 'gcc-libs' 'dotnet-runtime-10.0')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("setup_ksa_v${pkgver}.tar.gz::$url/download?file=setup_ksa_v${pkgver}.tar.gz"
	"kittenspaceagency.png")
noextract=()
sha256sums=('SKIP'
            'SKIP')
validpgpkeys=()

package() {
    install -dm755 "$pkgdir/opt/kittenspaceagency"

    # Extract tarball
    tar -xf "$srcdir/setup_ksa_v${pkgver}.tar.gz" -C "$pkgdir/opt/kittenspaceagency"

    # Flatten linux-x64
    cp -a "$pkgdir/opt/kittenspaceagency/linux-x64/." "$pkgdir/opt/kittenspaceagency/"
    rm -r "$pkgdir/opt/kittenspaceagency/linux-x64"

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/kittenspaceagency" << 'EOF'
#!/bin/bash
cd /opt/kittenspaceagency
exec ./KSA "$@"
EOF

        # Install icon
    install -Dm644 "$srcdir/kittenspaceagency.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/kittenspaceagency.png"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kittenspaceagency.desktop" << 'EOF'
[Desktop Entry]
Name=Kitten Space Agency
Comment=Experimental build of Kitten Space Agency
Exec=env XDG_SESSION_TYPE=x11 kittenspaceagency
Icon=kittenspaceagency
Terminal=false
Type=Application
Categories=Game;
StartupNotify=true
EOF

}

