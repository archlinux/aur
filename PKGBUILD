# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=free-the-bugs-bin
pkgver=0.6.0
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
source_x86_64=("free-the-bugs-0.6.0-x64::https://github.com/mlm-games/free-the-bugs/releases/download/0.6.0/free-the-bugs.x86_64")
source_aarch64=("free-the-bugs-0.6.0-arm64::https://github.com/mlm-games/free-the-bugs/releases/download/0.6.0/free-the-bugs.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('e1fd1fefce8bbdbc8958aa9af6cd0b858fa192acc0f0fafd4f95dfa856a813af')
sha256sums_aarch64=('ab59d87083a8a6d9276e0fed3f5d2ace5e3a0e04a39c88cd031fc71e70f6adf1')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/free-the-bugs-0.6.0-x64" "${pkgdir}/opt/${pkgname}/free-the-bugs"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/free-the-bugs-0.6.0-arm64" "${pkgdir}/opt/${pkgname}/free-the-bugs"
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
