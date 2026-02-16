# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=pomodorot-bin
pkgver=0.13.3
pkgrel=1
pkgdesc="A simple pomodoro timer application (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/pomodorot"
license=('GPL3')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'alsa-lib')
optdepends=('pipewire-pulse: for PipeWire audio support'
            'pulseaudio: for PulseAudio audio support')
provides=('pomodorot')
conflicts=('pomodorot')
options=('!strip')
source=("https://raw.githubusercontent.com/mlm-games/pomodorot/main/icon.png")
source_x86_64=("pomodorot-0.13.3-x64::https://github.com/mlm-games/pomodorot/releases/download/0.13.3/pomodorot.x86_64")
source_aarch64=("pomodorot-0.13.3-arm64::https://github.com/mlm-games/pomodorot/releases/download/0.13.3/pomodorot.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('6fc970934427f2b22e6799e76216de0d112e6286f62f62d9d3db806c15e2cec5')
sha256sums_aarch64=('910ed84f1e5d40661122a6800e12ec66b085c4e4aab706b9b5a72f5e824f8225')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/pomodorot-0.13.3-x64" "${pkgdir}/opt/${pkgname}/pomodorot"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/pomodorot-0.13.3-arm64" "${pkgdir}/opt/${pkgname}/pomodorot"
    fi

    ln -s "/opt/${pkgname}/pomodorot" "${pkgdir}/usr/bin/pomodorot"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/pomodorot.png"

    cat > "${pkgdir}/usr/share/applications/pomodorot.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Pomodorot
Exec=pomodorot
Terminal=false
Type=Application
Icon=pomodorot
Comment=A simple pomodoro timer application
Categories=Utility;Office;
StartupNotify=true
DESKTOP_EOF
}
