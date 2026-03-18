# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-simpleeval
_name=${pkgname#python-}
pkgver=1.0.7
pkgrel=1
pkgdesc="A simple, safe single expression evaluator library."
arch=(any)
url="https://github.com/danthedeckie/simpleeval"
license=(MIT)
depends=(
	python
)
makedepends=(
	python-build
	python-installer
	python-hatchling
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('1e10e5f9fec597814444e20c0892ed15162fa214c8a88f434b5b077cf2fef85b')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
