# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-braces
pkgname=python-$_pyname
pkgver=1.16.0
pkgrel=1
pkgdesc='Mixins to add easy functionality to Django class-based views, forms, and models'
arch=(any)
url="https://github.com/brack3t/$_pyname"
license=(BSD-3-Clause)
depends=(python
         python-django)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest
              python-pytest-mock)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('bafb96808ea32f6d0ad70c09ba5b8fc802928004d141fc13e12351e302e6e420')

prepare() {
	cd "$_archive"
	# Don't run coverage when testing
	sed -i -e '/addopts/d' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
