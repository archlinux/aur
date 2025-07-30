_name=mizani
pkgname=python-$_name
pkgver=0.14.2
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
sha256sums=('d7180bf7c6fa60a7aa5b78da903bc6b2ffc30602d479a4a07b5240bc5330491d')

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
