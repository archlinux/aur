# Maintainer: purpleneutral <purpleneutral@users.noreply.github.com>
pkgname=displayctl
pkgver=1.0.3
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
sha256sums=('e7edc71f501953fd2fc3db8ed6fd2aa185f78a0c37ba3c36973c662a217ffc28')

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
