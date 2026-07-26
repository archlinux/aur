# Maintainer: shorin <2433516202@qq.com>
pkgname=niri-display-settings-git
pkgver=r9.ec607d5
pkgrel=1
pkgdesc="A GTK4/libadwaita GUI to configure monitors for the niri compositor"
arch=('any')
url="https://github.com/SHORiN-KiWATA/niri-display-settings"
license=('MIT')

depends=(
    'python' 'python-gobject' 'gtk4' 'libadwaita' 'niri'
)
makedepends=(
    'git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
provides=('niri-display-settings')
conflicts=('niri-display-settings')
source=("git+https://github.com/SHORiN-KiWATA/niri-display-settings.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/niri-display-settings"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/niri-display-settings"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/niri-display-settings"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 io.github.shorin_kiwata.NiriDisplaySettings.desktop \
        "$pkgdir/usr/share/applications/io.github.shorin_kiwata.NiriDisplaySettings.desktop"
    install -Dm644 icons/niri-display-settings.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/niri-display-settings.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
