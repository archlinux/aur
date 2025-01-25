# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-simpleeval
_name=${pkgname#python-}
pkgver=1.0.3
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
sha256sums=('67bbf246040ac3b57c29cf048657b9cf31d4e7b9d6659684daa08ca8f1e45829')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
