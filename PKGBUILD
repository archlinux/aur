# Maintainer: Gökçe Aydos <aydos.de>

pkgname=jupyter-nbgrader
_realm=jupyter
_name=${pkgname#"$_realm"-}
pkgver=0.9.2
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
	jupyter-lsp

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
	npm # used by jlpm
)
source=(
	https://files.pythonhosted.org/packages/source/"${_name::1}/$_name/$_name-$pkgver".tar.gz
)
build() {
	cd nbgrader-"$pkgver" || exit
	python -m build --wheel --no-isolation
}
package() {
	cd nbgrader-"$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
	mv "$pkgdir"/usr/etc "$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('99409da055306524254a8d19595ec13810f11112f34c6a93306475861490a734')
