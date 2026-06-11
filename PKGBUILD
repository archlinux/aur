# Maintainer: Tristan <https://github.com/techtoboggan>
pkgname=claude-desktop-hardened-bin
pkgver=1.12603.0
pkgrel=1
pkgdesc="Claude Desktop for Linux (hardened) — bubblewrap sandboxing, credential redaction"
arch=('x86_64' 'aarch64')
url="https://github.com/techtoboggan/claude-desktop-hardened-linux"
license=('custom:Proprietary')
depends=('nodejs' 'npm' 'electron' 'p7zip' 'icoutils' 'imagemagick' 'xdg-utils' 'bubblewrap')
optdepends=(            'socat: IPC support'
            'gnome-keyring: credential storage'
            'wmctrl: X11 window listing for Computer Use'
            'xdotool: X11 input automation for Computer Use'
            'scrot: X11 screenshot capture for Computer Use'
            'xclip: X11 clipboard access for Computer Use'
            'xorg-xrandr: X11 display info for Computer Use'
            'grim: Wayland screenshot capture for Computer Use'
            'slurp: Wayland region selection for Computer Use'
            'wl-clipboard: Wayland clipboard access for Computer Use'
            'ydotool: Wayland input automation for Computer Use (run: sudo systemctl enable --now ydotool)'
            'wlr-randr: Wayland display info for Computer Use')
provides=('claude-desktop' 'claude-desktop-hardened')
conflicts=('claude-desktop' 'claude-desktop-bin' 'claude-desktop-hardened')

# This PKGBUILD operates on a pre-built staging directory.
# Run the build pipeline first, then makepkg from the staging dir.

package() {
    # Copy from the staging area prepared by the build pipeline
    cp -r "${srcdir}/staged/usr" "${pkgdir}/usr"

    # Fix chrome-sandbox permissions
    local sandbox="${pkgdir}/usr/lib/claude-desktop-hardened/app.asar.unpacked/node_modules/electron/dist/chrome-sandbox"
    if [ -f "$sandbox" ]; then
        chmod 4755 "$sandbox"
    fi
}
