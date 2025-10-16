# Maintainer: Your Name <your@email>
pkgname=pharm-record
pkgver=0.2.3
pkgrel=1
pkgdesc="A PySide6-based medication tracking application."
arch=('any')
url="https://codeberg.org/wonderfox/pharm-record/"
license=('CC-BY-SA-4.0')
depends=('python' 'python-platformdirs' 'pyside6' 'shiboken6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/wonderfox/pharm-record/archive/v$pkgver.tar.gz")
sha256sums=('08afefa092f1fd26db8113e1d84c20bf441fc9e46e8fa41e12c1ab3c1f66ff88')

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
