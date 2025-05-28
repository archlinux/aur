# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=pomodorot-bin
pkgver=0.10.2
pkgrel=3
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
source_x86_64=("pomodorot-0.10.2-x64::https://github.com/mlm-games/pomodorot/releases/download/0.10.2/pomodorot.x86_64")
source_aarch64=("pomodorot-0.10.2-arm64::https://github.com/mlm-games/pomodorot/releases/download/0.10.2/pomodorot.arm64")
sha256sums_x86_64=('8e18c0b2727b9cd7bc9d8147ffa642ddf449d90fecd9fc111bf0a5624cb645d6')
sha256sums_aarch64=('8d53f94bdd5847cb5b58f3585b2e36e3681aad0a95317422d3fd5d1c5f955396')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/pomodorot-0.10.2-x64" "${pkgdir}/opt/${pkgname}/pomodorot"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/pomodorot-0.10.2-arm64" "${pkgdir}/opt/${pkgname}/pomodorot"
    fi

    ln -s "/opt/${pkgname}/pomodorot" "${pkgdir}/usr/bin/pomodorot"

    cat > "${pkgdir}/usr/share/applications/pomodorot.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Pomodorot
Exec=pomodorot
Terminal=false
Type=Application
Comment=A simple pomodoro timer application
Categories=Utility;Office;
StartupNotify=true
DESKTOP_EOF
}
