# Maintainer: Pasical <pasicalyang@gmail.com>
# Rendered by Everywhere-AUR/scripts/sync_release.py; submit out/PKGBUILD.
pkgname=everywhere-bin
pkgver=0.9.0canary.20261028.29
pkgrel=1
pkgdesc='Context-aware AI assistant for your desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/Sylinko/Everywhere'
license=('BSL-1.1')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'icu' 'fontconfig' 'libx11' 'libice' 'libsm' 'libxext' 'libxcb' 'libxrandr' 'libxrender' 'libxi' 'libxcursor' 'wayland' 'libxkbcommon' 'glib2' 'at-spi2-core' 'xdg-utils' 'desktop-file-utils')
optdepends=('grim: Hyprland screenshot capture' 'wl-clipboard: Wayland text-selection monitoring' 'libnotify: desktop notifications')
provides=('everywhere')
conflicts=('everywhere')
_upstream_tag='v0.9.0-canary.20261028.29'
_mirror_repository='pasical/Everywhere-AUR'
_base="https://github.com/${_mirror_repository}/releases/download/${_upstream_tag}"
source=("${_base}/LICENSE" "${_base}/Everywhere-icon.png")
sha256sums=('1afb97b109ac6dc78fee57f86e854abe75bbdffb12b40d36c91084b12efa96a2' 'ef52179d078f3ee23a1eec9ded2dbb8a9529de49dd4412375fea7566f9f83c34')
source_x86_64=("${_base}/Everywhere-Linux-x64-v0.9.0-canary.20261028.29.tar.zst")
sha256sums_x86_64=('08de1f2cfe25e8cda0d2b6444c686fb04195e1bb4fd2ddf64b737c5e82d254a8')
source_aarch64=("${_base}/Everywhere-Linux-arm64-v0.9.0-canary.20261028.29.tar.zst")
sha256sums_aarch64=('6d563edfd43545b88d9407c0aa171dabba7591fef237aa74ca4e53f86b7cb735')
noextract=("Everywhere-Linux-x64-${_upstream_tag}.tar.zst" "Everywhere-Linux-arm64-${_upstream_tag}.tar.zst")

package() {
    local runtime
    case "$CARCH" in
        x86_64) runtime=x64 ;;
        aarch64) runtime=arm64 ;;
        *) return 1 ;;
    esac
    install -d "$pkgdir/opt/Everywhere" "$pkgdir/usr/bin"
    bsdtar -xf "$srcdir/Everywhere-Linux-${runtime}-${_upstream_tag}.tar.zst" -C "$pkgdir/opt/Everywhere" --no-same-owner
    chmod 755 "$pkgdir/opt/Everywhere/Everywhere" "$pkgdir/opt/Everywhere/Everywhere.Watchdog"
    ln -s /opt/Everywhere/Everywhere "$pkgdir/usr/bin/Everywhere"
    install -Dm644 "$srcdir/Everywhere-icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Everywhere.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/Everywhere.desktop" <<'EOF'
[Desktop Entry]
Name=Everywhere
Comment=A context-aware AI assistant for your desktop.
Exec=/usr/bin/Everywhere %U
Icon=Everywhere
Type=Application
Terminal=false
Categories=Utility;
Keywords=AI;tool;
EOF
}
