# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
_pkg="${pkgname#python-}"
pkgver=10.0.0
pkgrel=1
pkgdesc="Practical Machine Learning for NLP"
arch=("x86_64" "aarch64")
url="https://github.com/explosion/thinc"
license=("MIT")
depends=(
	"python-blis"
	"python-catalogue"
	"python-confection"
	"python-cymem"
    "python-h5py"
	"python-murmurhash"
	"python-numpy>=2.0"
	"python-packaging"
	"python-pathy"
	"python-preshed"
	"python-pydantic"
	"python-srsly"
	"python-wasabi"
)
makedepends=("cython" "python-build" "python-installer" "python-setuptools" "python-wheel")
optdepends=("python-cupy" "python-pytorch" "python-tensorflow")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkg}-${pkgver}.tar.gz")
sha256sums=("fca954898365f66d9a128eccec51c0151c4298d9bdd6ca2d7094a0686f674b3f")

build() {
	cd "${_pkg}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkg}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
