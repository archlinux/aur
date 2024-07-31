# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-goes2go'
_name=${pkgname#python-}
pkgver='2024.7.0'
pkgrel=1
pkgdesc="Retrieve GOES Satellite data from AWS. Also proves some RGB recipes."
url="https://github.com/blaylockbk/goes2go"
depends=('python-matplotlib' 'python-metpy' 'python-cartopy' 'python-pandas' 'python-s3fs' 'python-shapely' 'python-toml' 'python-xarray')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1cef2b7d22e4643d7ed3c27c2faa4f5cc96380835d208b6d9c7b8b1c42a3cbeb')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
