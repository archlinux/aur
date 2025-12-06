# Maintainer: wayvid contributors
# NOTE: This is a binary package. Pre-compiled binaries are downloaded from GitHub Releases.
# For source-based build, use wayvid-git instead.

pkgname=wayvid
pkgver=0.5.0
pkgrel=1
pkgdesc="Animated wallpaper manager for Wayland with GUI and Steam Workshop support (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/YangYuS8/wayvid"
license=('MIT')
depends=(
    'wayland'
    'mpv'
    'gcc-libs'
    'glibc'
    'zstd'
)
optdepends=(
    'mesa: Hardware video decoding with VA-API'
    'libva-intel-driver: Intel GPU hardware acceleration'
    'libva-mesa-driver: AMD GPU hardware acceleration'
    'nvidia-utils: NVIDIA GPU hardware acceleration'
    'steam: Steam Workshop integration for Wallpaper Engine imports'
)
provides=('wayvid')
conflicts=('wayvid-git')
source=(
    "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
    "$url/raw/refs/heads/main/systemd/wayvid.service"
    "$url/raw/refs/heads/main/configs/config.example.yaml"
    "$url/raw/refs/heads/main/README.md"
    "$url/raw/refs/heads/main/LICENSE-MIT"
    "$url/raw/refs/heads/main/logo.svg"
    "$url/raw/refs/heads/main/packaging/wayvid-gui.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!strip')

package() {
    # Install binaries (v0.5: GUI-first, no standalone daemon)
    install -Dm755 "$srcdir/wayvid-gui" "$pkgdir/usr/bin/wayvid-gui"
    install -Dm755 "$srcdir/wayvid-ctl" "$pkgdir/usr/bin/wayvid-ctl"
    
    # Install systemd service
    install -Dm644 "$srcdir/wayvid.service" "$pkgdir/usr/lib/systemd/user/wayvid.service"
    
    # Install config example
    install -Dm644 "$srcdir/config.example.yaml" "$pkgdir/usr/share/wayvid/config.example.yaml"
    
    # Install documentation
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install logo/icon
    install -Dm644 "$srcdir/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wayvid.svg"
    
    # Install desktop file
    install -Dm644 "$srcdir/wayvid-gui.desktop" "$pkgdir/usr/share/applications/wayvid.desktop"
    
    # Install license
    install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
