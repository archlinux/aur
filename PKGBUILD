# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tiledb
pkgname=python-$_name
pkgver=0.17.1
pkgrel=1
pkgdesc='Pythonic interface to the TileDB array storage manager'
arch=(x86_64)
url="https://github.com/TileDB-Inc/TileDB-Py"
license=(MIT)
_pyminor=10
depends=("python>=3.$_pyminor" "python<3.$((_pyminor + 1))" 'python-numpy>=1.21' python-packaging)
makedepends=(python-setuptools python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b6749c5785a5e4a407356633ecaf447d2dcae46f0320a693a280d525dbd61fdd')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check  # wants setuptools<=59.5.0
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
