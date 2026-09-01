# Maintainer: lumaseg
pkgname=workman
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland session manager — save and restore open windows (GNOME, Sway)"
arch=('any')
url="https://github.com/lumaseg/workman"
license=('MIT')
depends=('python')
optdepends=('gnome-shell>=45: for the GNOME backend (also needs the bundled shell extension)'
            'sway: for the Sway backend (uses swaymsg; no extension needed)')
makedepends=('python-hatchling' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('12c2b3e860a42a2d31659831cd5b8ec04f8fbcdc020efd83644cd972864b60ea')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/workman@workman"
    install -m644 extension/extension.js \
        "$pkgdir/usr/share/gnome-shell/extensions/workman@workman/extension.js"
    install -m644 extension/metadata.json \
        "$pkgdir/usr/share/gnome-shell/extensions/workman@workman/metadata.json"
}
