# Maintainer: Weather (Anonymous Name)

pkgname=python-myers
_pkg=myers
pkgver=1.0.1
pkgrel=1
pkgdesc='Compute the Myers diff of two lists'
arch=('any')
url="https://pypi.org/project/myers"
license=('MIT')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
_checkdepends=('python-pytest' 'python-flask' 'python-django')
source=("$_pkg-$pkgver.tar.gz::https://files.pythonhosted.org/packages/ac/49/49cb1d292dbce2999d7c812750f739e71fee2df845cf9852561ff64db5b8/$_pkg-$pkgver.tar.gz")
sha256sums=('4f9d7681c04e1fd0c61e840e26e22b1bd4d5031887c7d5fb43dccc76e64423a3')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

_check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

