# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-overturemaps'
_name="${pkgname#python-}"
pkgver='0.4.0'
pkgrel=1
pkgdesc="Python tools for interacting with Overture Maps (overturemaps.org) data."
url="https://pypi.org/project/overturemaps/"
depends=('python' 'python-click' 'python-pyarrow' 'python-shapely')
makedepends=('python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ce20b13e9d8e4415fc5d93fef4ff77b9534bcec692b35dfb916a0b9fa6ed4bfd')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
