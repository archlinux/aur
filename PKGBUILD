# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=cavern-cravers-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A roguelike turn-based virtual board game"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/cavern-cravers"
license=('GPL3')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'alsa-lib')
optdepends=('pipewire-pulse: for PipeWire audio support'
            'pulseaudio: for PulseAudio audio support')
provides=('cavern-cravers')
conflicts=('cavern-cravers')
options=('!strip')
source=("https://raw.githubusercontent.com/mlm-games/cavern-cravers/refs/heads/main/fastlane/metadata/android/en-US/images/icon.png")
source_x86_64=("cavern-cravers-0.9.1-x64::https://github.com/mlm-games/cavern-cravers/releases/download/0.9.1/cavern-cravers.x86_64")
source_aarch64=("cavern-cravers-0.9.1-arm64::https://github.com/mlm-games/cavern-cravers/releases/download/0.9.1/cavern-cravers.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('f2975b7575e22fb148df80fcc92e032b3e20d1902524a58607babfac28f3376e')
sha256sums_aarch64=('5a402d0aa8fc01b3eca3cdfb3acba6427bcf3cb149e81a13e65aa353e8c85771')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/cavern-cravers-0.9.1-x64" "${pkgdir}/opt/${pkgname}/cavern-cravers"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/cavern-cravers-0.9.1-arm64" "${pkgdir}/opt/${pkgname}/cavern-cravers"
    fi

    ln -s "/opt/${pkgname}/cavern-cravers" "${pkgdir}/usr/bin/cavern-cravers"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/cavern-cravers.png"

    cat > "${pkgdir}/usr/share/applications/cavern-cravers.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Cavern Cravers
Exec=cavern-cravers
Terminal=false
Type=Application
Icon=cavern-cravers
Comment=A roguelike turn-based virtual board game
Categories=Game;CardGame;StrategyGame;
StartupNotify=true
DESKTOP_EOF
}
