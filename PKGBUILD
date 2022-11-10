# Maintainer: Gökçe Aydos <aur2022_aydos_de>

pkgname=jupyter-nbgrader-git
_realm=jupyter
_name_wogit=${pkgname%-git}
_name=${_name_wogit#$_realm-}
provides=($_name_wogit)
conflicts=($_name_wogit)
pkgver=v0.8.1.r14.gd71461ed
pkgrel=1
pkgdesc="A system for assigning and grading notebooks"
arch=(any)
url=https://github.com/$_realm/$_name
license=(BSD)
depends=(
	python

	python-alembic
	python-ipywidgets
	python-jinja
	python-jsonschema
	python-jupyter_client
	jupyter-server
	python-jupyterlab_server
	python-markupsafe
	jupyter-nbclassic  # As of 2022-11-10 <0.4
	jupyter-nbclient
	jupyter-nbconvert
	jupyter-notebook
	python-dateutil
	python-rapidfuzz
	python-requests
	python-sqlalchemy
	python-traitlets  # As of 2022-11-10 <5.2.0
)
makedepends=(
	jupyterlab-hatch-jupyter-builder
	python-build
	python-installer
	python-wheel
	git
)
source=(git+https://github.com/$_realm/$_name)
md5sums=(SKIP)
pkgver() {
	cd $_name
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd $_name
	python -m build --wheel --no-isolation
}
package() {
	cd $_name
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
