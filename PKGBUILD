# Maintainer: 123llyrr
pkgname=plank-wayland-git
pkgver=r4.43b3a52
pkgrel=1
pkgdesc="Plank-like Wayland dock and launcher powered by Quickshell"
arch=('any')
url="https://github.com/123llyrr/plank-wayland"
license=('GPL-3.0-or-later')
depends=('quickshell' 'python')
optdepends=('hyprland: window tracking and focus integration')
makedepends=('git')
provides=('plank-wayland')
conflicts=('plank-wayland')
source=("git+https://github.com/123llyrr/plank-wayland.git")
sha256sums=('SKIP')

pkgver() {
    cd plank-wayland
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd plank-wayland

    install -dm755 "$pkgdir/usr/share/plank-wayland"
    cp -a components services shell.qml i18n.js settings.js apps.js README.md LICENSE run.sh "$pkgdir/usr/share/plank-wayland/"
    find "$pkgdir/usr/share/plank-wayland" -type d -name __pycache__ -prune -exec rm -rf {} +
    find "$pkgdir/usr/share/plank-wayland" -type f -name '*.pyc' -delete
    chmod 755 "$pkgdir/usr/share/plank-wayland/run.sh"

    install -Dm644 plank-wayland.desktop "$pkgdir/usr/share/applications/plank-wayland.desktop"
    install -Dm644 icons/plank-wayland.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/plank-wayland.svg"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/share/plank-wayland/run.sh "$pkgdir/usr/bin/plank-wayland"
}
