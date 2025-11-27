# Maintainer: wayvid contributors
# NOTE: This is a binary package. Pre-compiled binaries are downloaded from GitHub Releases.
# For source-based build, use wayvid-git instead.

pkgname=wayvid
pkgver=0.4.4
pkgrel=1
pkgdesc="Dynamic video wallpaper engine for Wayland with Steam Workshop and Niri support (pre-compiled binary)"
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
    'niri: Workspace-aware performance optimizations'
)
provides=('wayvid')
conflicts=('wayvid-git')
source=(
    "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
    "$url/raw/refs/heads/main/systemd/wayvid.service"
    "$url/raw/refs/heads/main/configs/config.example.yaml"
    "$url/raw/refs/heads/main/README.md"
    "$url/raw/refs/heads/main/LICENSE-MIT"
    "$url/raw/refs/heads/main/LICENSE-APACHE"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!strip')

package() {
    # Install binaries
    install -Dm755 "$srcdir/wayvid" "$pkgdir/usr/bin/wayvid"
    install -Dm755 "$srcdir/wayvid-ctl" "$pkgdir/usr/bin/wayvid-ctl"
    install -Dm755 "$srcdir/wayvid-gui" "$pkgdir/usr/bin/wayvid-gui"
    
    # Install systemd service
    install -Dm644 "$srcdir/wayvid.service" "$pkgdir/usr/lib/systemd/user/wayvid.service"
    
    # Install config example
    install -Dm644 "$srcdir/config.example.yaml" "$pkgdir/usr/share/wayvid/config.example.yaml"
    
    # Install documentation
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install licenses
    install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    # Install Apache license if download succeeded (may not exist in repository yet)
    [ -f "$srcdir/LICENSE-APACHE" ] && install -Dm644 "$srcdir/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" || true
}
