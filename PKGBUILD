_name=pyefd
pkgname=python-$_name
pkgver=1.7.0
pkgrel=1
pkgdesc='Elliptic Fourier Features of a Closed Contour'
arch=(any)
url="https://github.com/hbldh/$_name"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8252267a5455f72bba0baeb6b15e77de9cc802309b3f5d4a52534e41ad4aa187')

prepare() {
	cd "${_name/-/_}-$pkgver"
	sed -i 's/setup_requires=\["pytest-runner"\],//g' setup.py
}

build() {
	cd "${_name/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name/-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
