# Maintainer: Miran Kljun <miran.kljun@gmail.com>
pkgname=rclone-wiz
pkgver=1.7.4.r0.ge166485
pkgrel=1
pkgdesc="A simple and easy to use tool to configure, script, and mount cloud drives using rclone"
arch=('any')
url="https://github.com/themix88/Clone-WIZ"
_giturl="https://github.com/themix88/Clone-WIZ.git"
license=('GPL-3.0-only')

depends=(
    'python'
    'python-pyqt6'
    'rclone'
    'fuse3'
)

optdepends=(
    'konsole: Supported terminal for rclone config'
    'alacritty: Supported terminal for rclone config'
    'gnome-terminal: Supported terminal for rclone config'
    'xterm: Supported terminal for rclone config'
    'kitty: Supported terminal for rclone config'
    'ghostty: Supported terminal for rclone config'
)

makedepends=('git')

source=("$pkgname::git+$_giturl#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # Format: <version tag>.<commits since tag>.g<short hash>
    # Falls back to r<commit count>.g<hash> if no tags exist
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    # 1. Install the executable
    install -Dm755 "rclone-wiz.py" "$pkgdir/usr/bin/rclone-wiz"

    # 2. Install the desktop file
    install -Dm644 "rclone-wiz.desktop" "$pkgdir/usr/share/applications/rclone-wiz.desktop"

    # 3. Install the icon
    install -Dm644 "rclone-wiz.svg" "$pkgdir/usr/share/pixmaps/rclone-wiz.svg"

    # 4. Install the license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # 5. Install the VERSION changelog
    install -Dm644 "VERSION" "$pkgdir/usr/share/$pkgname/VERSION"

    # 6. Install the README
    install -Dm644 "README.md" "$pkgdir/usr/share/$pkgname/README.md"
}