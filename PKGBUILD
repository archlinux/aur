# Maintainer: purpleneutral <purpleneutral@users.noreply.github.com>
pkgname=displayctl
pkgver=1.0.2
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
sha256sums=('8ffbccd6d0fb78b93ffa7117b8d7026efdea019a19dc5285cd288deb2053b653')

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
