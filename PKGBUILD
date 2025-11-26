# Maintainer: mopi <mopigames@proton.me>
pkgname=westty
pkgver=1.0.0
pkgrel=2
pkgdesc="TTY-like Weston session with Kitty fullscreen"
arch=('any')
url="https://github.com/MopigamesYT/westty"
license=('MIT')
depends=('weston' 'kitty')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('72287e2b19f28f49085d606295f014637f11c1683e161bc488c59189be172169')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the westty script
    install -Dm755 westty.sh "$pkgdir/usr/bin/westty"

    # Fix the Exec path in desktop file
    sed -i 's|/home/mopi/.local/bin/westty|/usr/bin/westty|g' westty.desktop

    # Install the desktop session file
    install -Dm644 westty.desktop "$pkgdir/usr/share/wayland-sessions/westty.desktop"

    # Install example weston configuration
    install -Dm644 weston.ini.example "$pkgdir/usr/share/doc/$pkgname/weston.ini.example"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
