# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=plutonic-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Suikalike game where you shoot planets in space"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/plutonic"
license=('GPL3')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'alsa-lib')
optdepends=('pipewire-pulse: for PipeWire audio support'
            'pulseaudio: for PulseAudio audio support')
provides=('plutonic')
conflicts=('plutonic')
options=('!strip')
source=("https://raw.githubusercontent.com/mlm-games/plutonic/refs/heads/main/fastlane/metadata/android/en-US/images/icon.png")
source_x86_64=("plutonic-1.1.2-x64::https://github.com/mlm-games/plutonic/releases/download/1.1.2/plutonic.x86_64")
source_aarch64=("plutonic-1.1.2-arm64::https://github.com/mlm-games/plutonic/releases/download/1.1.2/plutonic.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('392d8d1326948ccf6bba4f104449a4fe4edc7d3893ee2751e02d99aaa2de488a')
sha256sums_aarch64=('6e1a02d2fd759a926b3fe5cbf7139af3b88ee97444d0dee571bea352ffe32584')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/plutonic-1.1.2-x64" "${pkgdir}/opt/${pkgname}/plutonic"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/plutonic-1.1.2-arm64" "${pkgdir}/opt/${pkgname}/plutonic"
    fi

    ln -s "/opt/${pkgname}/plutonic" "${pkgdir}/usr/bin/plutonic"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/plutonic.png"

    cat > "${pkgdir}/usr/share/applications/plutonic.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Plutonic
Exec=plutonic
Terminal=false
Type=Application
Icon=plutonic
Comment=Suikalike game where you shoot planets in space
Categories=Games;
StartupNotify=true
DESKTOP_EOF
}
