# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-goes2go'
_name=${pkgname#python-}
pkgver='2023.4.2'
pkgrel=1
pkgdesc="Track earth satellite TLE orbits using up-to-date 2010 version of SGP4"
url="https://github.com/blaylockbk/goes2go"
depends=('python-matplotlib' 'python-metpy' 'python-cartopy' 'python-pandas' 'python-s3fs' 'python-shapely' 'python-toml' 'python-xarray')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('12a203f52090203d70bee182b2cb0b62a6c035554296123780ae4c5dcd418012')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
