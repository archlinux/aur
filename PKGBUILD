# Maintainer: leuko <leuko_aydos_de>

pkgname=jupyter-nbgrader
_realm=jupyter
_name=${pkgname#$_realm-}
pkgver=0.8.1
pkgrel=1
pkgdesc="A system for assigning and grading notebooks"
arch=(any)
url=https://github.com/$_realm/$_name
license=(BSD)
depends=(
	python
	python-setuptools

	python-sqlalchemy
	python-dateutil
	jupyter-notebook
	jupyter-nbconvert
	python-requests
	python-jsonschema
	python-alembic
	python-rapidfuzz
	python-jinja
	python-markupsafe
	python-jupyter_client
	jupyter-server
	python-qtconsole
	python-ipywidgets
	jupyter-nbclient
	python-traitlets
)
makedepends=(
	jupyterlab-hatch-jupyter-builder
	python-build
	python-installer
	python-wheel
)
source=(
    https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
sha256sums=('af9303537687c8326591aaa996970a3b158f6bc065da3a4b292b9060e1edee71')
build() {
	cd nbgrader-$pkgver
	python -m build --wheel --no-isolation
}
package() {
	cd nbgrader-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
