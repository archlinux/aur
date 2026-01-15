# Maintainer: MLM-stuff gfxoxinzh@mozmail.com
pkgname=godot-preview-bin
pkgver=4.6rc1
_realver=4.6-rc1
pkgrel=1
pkgdesc="Godot Engine Preview/Beta - Prebuilt binary from official builds"
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
depends=('glibc' 'libglvnd' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'hicolor-icon-theme' 'libxrender' 'libx11' 'libxext')
optdepends=('pipewire-alsa: Audio support'
            'pipewire-pulse: Audio support')
provides=('godot-preview')
conflicts=('godot-preview')
source=("https://github.com/godotengine/godot-builds/releases/download/${_realver}/Godot_v${_realver}_linux.x86_64.zip"
        "godot-preview.desktop"
        "godot-preview.svg")
sha256sums=('3c638cb6c9b01883b14f3a6e4b9ca6224c687f15a37bac8dcfe628905659fc56'
            'SKIP'
            'SKIP')

package() {
    # Extract binary
    install -dm755 "$pkgdir/opt/godot-preview"
    install -Dm755 "Godot_v${_realver}_linux.x86_64" "$pkgdir/opt/godot-preview/godot-preview"
    
    # Create symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/godot-preview/godot-preview "$pkgdir/usr/bin/godot-preview"
    
    # Install desktop entry
    install -Dm644 "$srcdir/godot-preview.desktop" "$pkgdir/usr/share/applications/godot-preview.desktop"
    
    # Install icon
    install -Dm644 "$srcdir/godot-preview.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/godot-preview.svg"
}
