# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-overturemaps'
_name="${pkgname#python-}"
pkgver='0.8.0'
pkgrel=1
pkgdesc="Python tools for interacting with Overture Maps (overturemaps.org) data."
url="https://pypi.org/project/overturemaps/"
depends=('python' 'python-click' 'python-geopandas' 'python-pyarrow' 'python-shapely')
makedepends=('python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('beac618c6f2d6955b060da30173f76655f5f269d38566fc19be1fe9d328c32fc')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
