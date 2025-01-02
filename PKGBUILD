# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-data-viewer'
_name=sphinx_data_viewer
pkgver='0.1.5'
pkgrel=1
pkgdesc="Sphinx extension to show data in an interactive list view"
url="https://github.com/useblocks/sphinx-data-viewer"
depends=('python-sphinx')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a7d5e58613562bb745380bfe61ca8b69997998167fd6fa9aea55606c9a4b17e4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
