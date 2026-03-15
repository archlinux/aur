# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-simpleeval
_name=${pkgname#python-}
pkgver=1.0.6
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
sha256sums=('3a5a743a4f17c53854648144ae41f73eb4f573438d039a59f42cc3172b336141')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
