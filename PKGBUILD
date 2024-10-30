_name=mizani
pkgname=python-$_name
pkgver=0.13.0
pkgrel=1
pkgdesc='Scales for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(BSD)
depends=(
	python
	python-numpy
	python-scipy
	python-pandas
)
makedepends=(
	python-setuptools
	python-setuptools-scm
	python-build
	python-installer
	python-wheel
)
checkdepends=(
	python-pytest
	python-pytest-cov
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3d658df352a1c6342eb56b146ae242ab916bd717ecd75ffb14961559ccbc9cb8')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	PYTHONPATH=. pytest --color=yes -v
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
