# Maintainer: Victor Sosa <victorsosadev@gmail.com>
pkgname=vswallpaper-effect
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland wallpaper app with real-time OpenGL effects and a GTK3 live editor"
arch=('any')
url="https://github.com/victorsosaMx/vsWallpaper-Effect"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'gtk-layer-shell'
    'python-opengl'
    'python-cairo'
)
optdepends=(
    'python-opengl-accelerate: faster OpenGL bindings'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/victorsosaMx/vsWallpaper-Effect/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1ffd406432b3ef49c85355c0e5142faeec08395e51ec4635ed5377048aec5a0')

build() {
    cd "vsWallpaper-Effect-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "vsWallpaper-Effect-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install MIT license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true

    # Install icon
    install -Dm644 vswallpaper-effect.png \
        "$pkgdir/usr/share/pixmaps/$pkgname.png" 2>/dev/null || true

    # Install desktop entry if present
    install -Dm644 vswallpaper-effect.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop" 2>/dev/null || true

    # Install systemd user service if present
    install -Dm644 vswallpaper-effect.service \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service" 2>/dev/null || true
}
