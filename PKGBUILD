# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-goes2go'
_name=${pkgname#python-}
pkgver='2024.4.0'
pkgrel=1
pkgdesc="Track earth satellite TLE orbits using up-to-date 2010 version of SGP4"
url="https://github.com/blaylockbk/goes2go"
depends=('python-matplotlib' 'python-metpy' 'python-cartopy' 'python-pandas' 'python-s3fs' 'python-shapely' 'python-toml' 'python-xarray')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('019ed86273c741c1980121e82ba93aaf9ec010b5da268df3eb6272ac5c683046')

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
