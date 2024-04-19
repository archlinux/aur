# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-overturemaps'
_name="${pkgname#python-}"
pkgver='0.3.0'
pkgrel=1
pkgdesc="Python tools for interacting with Overture Maps (overturemaps.org) data."
url="https://pypi.org/project/overturemaps/"
depends=('python' 'python-click' 'python-pyarrow' 'python-shapely')
makedepends=('python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('12ea55d9c6f906b18163c109b6522403dcd8b2c7269fa3137d34dbf4bb91ca29')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
