# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=free-the-bugs-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A short game on solving small java bugs (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/free-the-bugs"
license=('GPL3')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'alsa-lib')
optdepends=('pipewire-pulse: for PipeWire audio support'
            'pulseaudio: for PulseAudio audio support')
provides=('free-the-bugs')
conflicts=('free-the-bugs')
options=('!strip')
source=("https://raw.githubusercontent.com/mlm-games/free-the-bugs/refs/heads/main/fastlane/metadata/android/en-US/images/icon.png")
source_x86_64=("free-the-bugs-0.5.2-x64::https://github.com/mlm-games/free-the-bugs/releases/download/0.5.2/free-the-bugs.x86_64")
source_aarch64=("free-the-bugs-0.5.2-arm64::https://github.com/mlm-games/free-the-bugs/releases/download/0.5.2/free-the-bugs.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('2d549eb6035457e1cf8fb62871a6fb00b3cc7f49c66b4f5f95d32cbabac4be73')
sha256sums_aarch64=('3bd8d7a4a85a1a0d5c145759e4b59bde987076d0572011b9affa1866f01868c4')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/free-the-bugs-0.5.2-x64" "${pkgdir}/opt/${pkgname}/free-the-bugs"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/free-the-bugs-0.5.2-arm64" "${pkgdir}/opt/${pkgname}/free-the-bugs"
    fi

    ln -s "/opt/${pkgname}/free-the-bugs" "${pkgdir}/usr/bin/free-the-bugs"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/free-the-bugs.png"

    cat > "${pkgdir}/usr/share/applications/free-the-bugs.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=FreeTheBugs
Exec=free-the-bugs
Terminal=false
Type=Application
Icon=free-the-bugs
Comment=A short narrative bug solver
Categories=Utility;Office;
StartupNotify=true
DESKTOP_EOF
}
