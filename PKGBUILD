# Maintainer: Gökçe Aydos <aur2022_aydos_de>

pkgname=jupyter-nbgrader-git
_realm=jupyter
_name_wogit=${pkgname%-git}
_name=${_name_wogit#"$_realm"-}
provides=("$_name_wogit")
conflicts=("$_name_wogit")
pkgver=v0.9.1.r1.g2ef44515
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
	python-jupyterlab-server
	jupyter-nbclient
	jupyter-nbconvert
	jupyter-notebook
	python-dateutil
	python-rapidfuzz
	python-requests
	python-sqlalchemy
	python-pyaml
	jupyterlab
	python-types-python-dateutil
	python-terminado
	python-debugpy
	jupyterlab
	jupyter-lsp
	python-types-python-dateutil
	python-terminado
	python-debugpy

	# Additional optional deps from jsonschema probably due to https://github.com/jupyter/jupyter_events/blob/9b99f6718a3bb2686aab51e17f5c7ee276baf316/pyproject.toml#L31C4-L33C112
	python-fqdn
	python-rfc3986-validator
	python-rfc3339-validator
	python-webcolors
	python-uri-template
	python-jsonpointer
	python-isoduration
)
makedepends=(
	python-hatch-jupyter-builder
	python-build
	python-installer
	python-wheel
	git
	npm # used by jlpm
)
source=(git+https://github.com/"$_realm/$_name")
md5sums=(SKIP)
pkgver() {
	cd "$_name" || exit
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "$_name" || exit
	python -m build --wheel --no-isolation
}
package() {
	cd "$_name" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
	mv "$pkgdir"/usr/etc "$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
