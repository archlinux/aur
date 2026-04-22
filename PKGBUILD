# Maintainer: Zeus-Deus <github.commits@widow.cc>
pkgname=voxtype-tui
pkgver=0.1.4
pkgrel=1
pkgdesc="Textual-based TUI for managing Voxtype (Linux voice-to-text daemon)"
arch=('any')
url="https://github.com/Zeus-Deus/voxtype-tui"
license=('MIT')
depends=(
    'python'
    'python-textual'
    'python-tomlkit'
    'voxtype-bin'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'libpulse: audio device enumeration via pactl'
    'systemd: daemon restart prompts via systemctl --user'
)
install=voxtype-tui.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/voxtype-tui/archive/v$pkgver.tar.gz")
sha256sums=('8f1a4fb29d2cc833bdaec97fd16c08bd07e2d98bc7df89dc3b978c520b073374')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
    install -Dm644 contrib/voxtype-tui.desktop \
        "$pkgdir/usr/share/applications/voxtype-tui.desktop"

    install -Dm755 scripts/install-omarchy.sh \
        "$pkgdir/usr/share/$pkgname/install-omarchy.sh"
    install -Dm755 scripts/uninstall-omarchy.sh \
        "$pkgdir/usr/share/$pkgname/uninstall-omarchy.sh"
}
