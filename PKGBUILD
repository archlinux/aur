# Maintainer: frsaghna <frsaghna@github.com>
pkgname=weg-fm
pkgver=1.0.5
pkgrel=1
pkgdesc="Keyboard-first GTK4 file manager for Linux featuring desktop interop and multi-level undo"
arch=('any')
url="https://github.com/frsaghna/weg-fm"
license=('GPL-3.0-or-later')
depends=('gtk4' 'python-gobject' 'python')
optdepends=(
    'fd: for fast recursive fuzzy search'
    'ffmpegthumbnailer: for video thumbnail generation'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('110c837bf19362a03715c1d81e0a30d9852b1971602907f72e447a1b734f0ae8')

prepare() {
    rm -rf "$pkgname-$pkgver"
    tar -xzf "$pkgname-$pkgver.tar.gz"
}

build() {
    cd "$pkgname-$pkgver"
    rm -rf build dist *.egg-info
    /usr/bin/python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
