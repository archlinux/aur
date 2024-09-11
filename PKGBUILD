# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-overturemaps'
_name="${pkgname#python-}"
pkgver='0.9.0'
pkgrel=1
pkgdesc="Python tools for interacting with Overture Maps (overturemaps.org) data."
url="https://pypi.org/project/overturemaps/"
depends=('python' 'python-click' 'python-geopandas' 'python-pyarrow' 'python-shapely')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('26c82e7c4f179b0ef15d5ca933e83756399fe5f2ff15047175d192a50efad8f4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
