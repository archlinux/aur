# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=floppy-warriors-bin
pkgver=1.0.3
pkgrel=1
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
source_x86_64=("floppy-warriors-1.0.3-x64::https://github.com/mlm-games/floppy-warriors/releases/download/1.0.3/floppy-warriors.x86_64")
source_aarch64=("floppy-warriors-1.0.3-arm64::https://github.com/mlm-games/floppy-warriors/releases/download/1.0.3/floppy-warriors.arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('2ca38e12c846fb99eaaa1dc7cf906d61450be3ee174ee8eec80657da590d6aff')
sha256sums_aarch64=('c7bfc7f61fe42d9197623d53a4f61b97207d924cf15a59af54ebe02091eae41d')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/opt/${pkgname}/"

    if [[ $CARCH == "x86_64" ]]; then
        install -Dm755 "$srcdir/floppy-warriors-1.0.3-x64" "${pkgdir}/opt/${pkgname}/floppy-warriors"
    elif [[ $CARCH == "aarch64" ]]; then
        install -Dm755 "$srcdir/floppy-warriors-1.0.3-arm64" "${pkgdir}/opt/${pkgname}/floppy-warriors"
    fi

    ln -s "/opt/${pkgname}/floppy-warriors" "${pkgdir}/usr/bin/floppy-warriors"
    
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/floppy-warriors.png"

    cat > "${pkgdir}/usr/share/applications/floppy-warriors.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Floppy Warriors #TODO: Edit when using
Exec=floppy-warriors
Terminal=false
Type=Application
Icon=floppy-warriors
Comment=A janky ragdoll archery battle game
Categories=Games;
StartupNotify=true
DESKTOP_EOF
}
