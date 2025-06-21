# Maintainer: Marc Gibb <mrcgibb@live.co.uk>
pkgname=hyprland-gamescope-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Seamless session switcher between Hyprland and Gamescope for Arch Linux gaming"
arch=('any')
url="https://github.com/Ripplingsnake12/hyprland-gamescope-switcher"
license=('GPL3')
depends=(
    'hyprland'
    'wofi'
    'sddm'
    'uwsm'
    'gamescope'
    'gamescope-session-git'
    'gamescope-session-steam-git'
    'steam'
    'mangohud'
    'bash'
    'systemd'
    'dbus'
)
makedepends=('git')
optdepends=(
    'mako: for notifications'
    'dunst: alternative notification daemon'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('696b02699a4d910afaabf0e68a8766bb328071ebd5c1b6612e81d19e0aef71db')

package() {
    cd "$pkgname-$pkgver"

    # Install the main setup script
    install -Dm755 setup-switcher.sh "$pkgdir/usr/bin/hyprland-gamescope-setup"

    # Install the session switcher script
    install -Dm755 switch-session.sh "$pkgdir/usr/share/$pkgname/switch-session.sh"

    # Install the session launcher
    install -Dm755 session-launcher.sh "$pkgdir/usr/share/$pkgname/session-launcher.sh"

    # Install systemd service override
    install -Dm644 gamescope-override.conf "$pkgdir/usr/share/$pkgname/systemd/gamescope-override.conf"

    # Install desktop entry template
    install -Dm644 switcher.desktop "$pkgdir/usr/share/$pkgname/switcher.desktop"

    # Install Wofi style
    install -Dm644 wofi-style.css "$pkgdir/usr/share/$pkgname/wofi-style.css"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
