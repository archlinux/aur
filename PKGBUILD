# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-needs'
_name=sphinx_needs
pkgver='4.1.0'
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
rl="https://www.sphinx-needs.com/"
depends=(
	'python-jsonschema'
	'python-matplotlib'
	'python-requests'
	'python-requests-file'
	'python-sphinx'
	'python-sphinx-data-viewer'
	'python-sphinxcontrib-jquery'
	'python-tomli'
	'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
#checkdepends=(
#	'python-defusedxml'
#	'python-lxml'
#	'python-pytest'
#	'python-pytest-cov'
#	'python-pytest-xprocess'
#	'python-pytest-xdist'
#	'python-responses'
#	'python-sphinxcontrib-plantuml'
#	'python-syrupy'
#)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7d40e9c29353d9784f469b2093412846060cda4f3b55127ac58a2692c3381ef9')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "${srcdir}/${_name}-${pkgver}"
#	python -m pytest test/
#}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
