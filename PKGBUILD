# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-skyfield'
_name=${pkgname#python-}
pkgver='1.46'
pkgrel=3
pkgdesc="Elegant astronomy for Python"
url="https://rhodesmill.org/skyfield/"
depends=('ipython' 'python-certifi' 'python-jplephem' 'python-matplotlib' 'python-mock' 'python-pandas' 'python-sgp4' 'python-sympy')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytz')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('27a54edbc46232a11019bcd88a9b74d36770aff26ff8ee631b90a81ba0be93e4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

