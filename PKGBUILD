# Maintainer: purpleneutral <purpleneutral@users.noreply.github.com>
pkgname=displayctl
pkgver=1.0.1
pkgrel=1
pkgdesc="GTK 4 display configuration tool with visual layout editor"
arch=('any')
url="https://github.com/purpleneutral/displayctl"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'pango')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'xorg-xrandr: X11 display backend'
    'wlr-randr: Wayland (wlroots) display backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4d7a9dcc1d02af1e86fd9e4beb1a4f6c6c54e51b6120f93f310c379e491a626')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 displayctl.desktop \
        "$pkgdir/usr/share/applications/displayctl.desktop"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
