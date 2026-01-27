# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=floppy-warriors-bin
pkgver=1.1.0
pkgrel=3
pkgdesc="A janky ragdoll archery battle game"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/floppy-warriors"
license=('GPL3')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'alsa-lib')
optdepends=('pipewire-pulse: for PipeWire audio support'
            'pulseaudio: for PulseAudio audio support')
provides=('floppy-warriors')
conflicts=('floppy-warriors')
options=('!strip')
source=("https://raw.githubusercontent.com/mlm-games/floppy-warriors/refs/heads/main/fastlane/metadata/android/en-US/images/icon.png")
source_x86_64=("floppy-warriors-1.1.0-x64::https://github.com/mlm-games/floppy-warriors/releases/download/1.1.0/floppy-warriors.x86_64")
source_aarch64=("floppy-warriors-1.1.0-arm64::https://github.com/mlm-games/floppy-warriors/releases/download/1.1.0/floppy-warriors.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('0ddbe93811bbbffb269bdc92ab87448cc85541be7b3b782ef20f3755b6cb95f9')
sha256sums_aarch64=('27900aaa2b0e1eba1374dff8aafb1277ed45e24b7dd2a19056fbcb8ae0ed5b6f')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/floppy-warriors-1.1.0-x64" "${pkgdir}/opt/${pkgname}/floppy-warriors"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/floppy-warriors-1.1.0-arm64" "${pkgdir}/opt/${pkgname}/floppy-warriors"
    fi

    ln -s "/opt/${pkgname}/floppy-warriors" "${pkgdir}/usr/bin/floppy-warriors"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/floppy-warriors.png"

    cat > "${pkgdir}/usr/share/applications/floppy-warriors.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Floppy Warriors
Exec=floppy-warriors
Terminal=false
Type=Application
Icon=floppy-warriors
Comment=A janky ragdoll archery battle game
Categories=Games;
StartupNotify=true
DESKTOP_EOF
}
