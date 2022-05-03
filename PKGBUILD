# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-visvis
_pkg="${pkgname#python-}"
pkgver=1.13.0
pkgrel=1
pkgdesc="Python library for visualization of 1D to 4D data"
url="https://github.com/almarklein/visvis"
arch=('any')
license=('BSD')
depends=('python-numpy' 'python-opengl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-pyqt4: for Qt4 backend'
            'python-pyside: for another Qt4 backend'
            'wxpython: for WxWidgets backend'
            'pygtk: for GTK backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2858c61b9b2ff17d1f9e8bffb0445077e2e9bb93fe59ee3812dcaa7e0d43fda')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
