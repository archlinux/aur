# Maintainer: Your Name <your@email>
pkgname=pharm-record
pkgver=0.3
pkgrel=1
pkgdesc="A PySide6-based medication tracking application."
arch=('any')
url="https://codeberg.org/wonderfox/pharm-record/"
license=('CC-BY-SA-4.0')
depends=('python' 'python-platformdirs' 'pyside6' 'shiboken6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/wonderfox/pharm-record/archive/v$pkgver.tar.gz")
sha256sums=('b8f8ea236c2b5e742e78dc4f19bd00d3158779514404712a7eba3003cd223f7f')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 pharm-record.desktop "$pkgdir/usr/share/applications/pharm-record.desktop"
    install -Dm644 pharm-record.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pharm-record.png"

}
