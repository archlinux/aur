# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-needs'
_name=sphinx_needs
pkgver='1.3.0'
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
url="https://www.sphinx-needs.com/"
depends=('python-jsonschema' 'python-matplotlib' 'python-requests-file' 'python-sphinx')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5c9836f911ce48e06ebf3fba75dbf9f033d5eb5eaaf743c6e23841ffa77c4c59')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
