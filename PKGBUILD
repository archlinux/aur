# Maintainer: Jonathan Freed <jon at freed dot dev>
pkgname=niri-screensaver
pkgver=0.7.0
pkgrel=1
pkgdesc="TerminalTextEffects-based screensaver for the niri Wayland compositor"
arch=('any')
url="https://github.com/jfreed-dev/niri-screensaver"
license=('GPL-3.0-only')
depends=(
    'alacritty'
    'niri'
    'python-terminaltexteffects'
    'jq'
)
optdepends=(
    'noctalia-shell: idle/lock integration via included plugin'
    'playerctl: now-playing overlay'
    'wlrctl: cursor parking under niri'
    'ydotool: cursor-parking fallback if wlrctl is absent'
    'figlet: large ASCII rendering for clock and overlays'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fac008812341d558209606f27acc6f533e487012d2fd7265d611995cd92f8a79')
install="$pkgname.install"

package() {
    cd "$pkgname-$pkgver"

    install -Dm 0755 bin/niri-screensaver         "$pkgdir/usr/bin/niri-screensaver"
    install -Dm 0755 bin/niri-screensaver-launch  "$pkgdir/usr/bin/niri-screensaver-launch"
    install -Dm 0755 bin/niri-screensaver-ctl     "$pkgdir/usr/bin/niri-screensaver-ctl"

    install -Dm 0644 share/alacritty-screensaver.toml \
        "$pkgdir/usr/share/niri-screensaver/alacritty-screensaver.toml"
    install -d "$pkgdir/usr/share/niri-screensaver/logos"
    install -m 0644 share/logos/*.txt \
        "$pkgdir/usr/share/niri-screensaver/logos/"
    install -m 0644 share/logos/LICENSES.md \
        "$pkgdir/usr/share/niri-screensaver/logos/LICENSES.md"

    install -Dm 0644 share/icons/hicolor/scalable/apps/niri-screensaver.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/niri-screensaver.svg"
    install -Dm 0644 share/applications/niri-screensaver.desktop \
        "$pkgdir/usr/share/applications/niri-screensaver.desktop"

    install -Dm 0644 docs/niri-window-rule.kdl \
        "$pkgdir/usr/share/doc/$pkgname/niri-window-rule.kdl"
    install -Dm 0644 docs/noctalia-customCommand.json \
        "$pkgdir/usr/share/doc/$pkgname/noctalia-customCommand.json"
    install -Dm 0644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm 0644 CHANGELOG.md \
        "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # Reference copy of the Noctalia plugin. Noctalia only scans
    # ~/.config/noctalia/plugins/ so users either symlink from here
    # or install via the Noctalia plugins registry once it ships.
    install -d "$pkgdir/usr/share/niri-screensaver/noctalia-plugin"
    cp -r noctalia-plugin/. "$pkgdir/usr/share/niri-screensaver/noctalia-plugin/"

    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
