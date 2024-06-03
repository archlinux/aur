# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-needs'
_name=sphinx_needs
pkgver='2.1.0'
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
url="https://www.sphinx-needs.com/"
depends=('python-jsonschema' 'python-matplotlib' 'python-requests-file' 'python-sphinx' 'python-sphinxcontrib-plantuml' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b71ae36b3c14000ceedc42b1b230f214fececb227dbe4e282bc0b8ac7b7e76c8')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
