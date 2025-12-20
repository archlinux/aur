# Maintainer: Stewart Wong <siwei.wong@gmail.com>
pkgname=hamr
pkgver=0.6.1
pkgrel=1
pkgdesc='Extensible launcher for Hyprland built with Quickshell'
arch=('any')
url='https://github.com/Stewart86/hamr'
license=('GPL-3.0-or-later')
depends=(
    # Core (quickshell is in extra repo)
    'quickshell'
    'qt6-5compat'

    # Python runtime
    'python'
    'python-click'

    # Thumbnail generation
    'python-loguru'
    'python-tqdm'
    'python-gobject'
    'gnome-desktop-4'

    # Clipboard
    'wl-clipboard'
    'cliphist'

    # File search
    'fd'
    'fzf'

    # Desktop integration
    'xdg-utils'
    'libnotify'
    'gtk3'
    'hyprland'
    'libpulse'
    'jq'

    # Calculator
    'libqalculate'

    # Fonts
    'ttf-material-symbols-variable'
    'ttf-jetbrains-mono-nerd'
)
optdepends=(
    'ttf-readex-pro: Reading font for cards (AUR)'
    'tesseract: OCR text extraction for screenshot search'
    'tesseract-data-eng: English OCR language data'
    'imagemagick: Alternative thumbnail generation'
    'bitwarden-cli: Bitwarden password manager integration'
    'slurp: Screen region selection for screenshots'
    'wf-recorder: Screen recording'
)
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=hamr.install

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install to /etc/xdg/quickshell/hamr (system-wide quickshell config)
    install -dm755 "$pkgdir/etc/xdg/quickshell/$pkgname"
    cp -r modules services plugins scripts assets defaults "$pkgdir/etc/xdg/quickshell/$pkgname/"
    cp *.qml "$pkgdir/etc/xdg/quickshell/$pkgname/"

    # Install hamr command
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash
exec qs -c hamr "$@"
EOF
}
