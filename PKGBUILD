# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-needs'
_name=sphinx_needs
pkgver='3.0.0'
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
url="https://www.sphinx-needs.com/"
depends=('python-jsonschema' 'python-matplotlib' 'python-requests-file' 'python-sphinx' 'python-sphinxcontrib-plantuml' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2c8892468d0bad131d94f221ac6e8595c30a07ef54b532511250e79816b08d96')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
