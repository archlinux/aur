# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=imagot-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="An image viewer made in godot (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/imagot"
license=('GPL3')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'alsa-lib')
optdepends=('pipewire-pulse: for PipeWire audio support'
            'pulseaudio: for PulseAudio audio support')
provides=('imagot')
conflicts=('imagot')
options=('!strip')
source=("https://raw.githubusercontent.com/mlm-games/imagot/main/icon.png")
source_x86_64=("imagot-0.2.5-x64::https://github.com/mlm-games/imagot/releases/download/0.2.5/imagot.x86_64")
source_aarch64=("imagot-0.2.5-arm64::https://github.com/mlm-games/imagot/releases/download/0.2.5/imagot.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('050563fc854c4d8ded70708562da41c712324886a4b8969cbe7d76fc9d755e04')
sha256sums_aarch64=('8d7a5b097fb71f238186d2e8bdf1b499b4a20c72641362afc352991bfa9867bd')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/imagot-0.2.5-x64" "${pkgdir}/opt/${pkgname}/imagot"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/imagot-0.2.5-arm64" "${pkgdir}/opt/${pkgname}/imagot"
    fi

    ln -s "/opt/${pkgname}/imagot" "${pkgdir}/usr/bin/imagot"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/imagot.png"
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/icons/imagot.png"

    cat > "${pkgdir}/usr/share/applications/imagot.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Imagot
Exec=imagot
Terminal=false
Type=Application
Icon=imagot
Comment=An image viewer made using godot
Categories=Utility;Office;
StartupNotify=true
DESKTOP_EOF
}
