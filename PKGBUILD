# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-needs'
_name=sphinx_needs
pkgver='2.0.0'
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
url="https://www.sphinx-needs.com/"
depends=('python-jsonschema' 'python-matplotlib' 'python-requests-file' 'python-sphinx')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cbb42e919b20cf758f6d0571709fe95ec08b3e2e8f386274ddd738e9e924ceb7')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
