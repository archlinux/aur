# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-skyfield'
_name=${pkgname#python-}
pkgver='1.48'
pkgrel=1
pkgdesc="Elegant astronomy for Python"
url="https://rhodesmill.org/skyfield/"
depends=('ipython' 'python-astropy' 'python-certifi' 'python-jplephem' 'python-matplotlib' 'python-mock' 'python-pandas' 'python-sgp4' 'python-sympy')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytz')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8b81f15b65e0b826341b17bf9e1446a0af94e49ed5983c04f123da49c1045fe1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

