# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Mario Ortiz Manero <marioortizmanero@gmail.com>

pkgname=python-tekore
pkgver=6.0.0
pkgrel=2
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("LicenseRef-MIT")
depends=(
	"python"
	"python-httpx"
	"python-pydantic")
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
	"python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/felix-hilden/tekore/archive/v${pkgver}.tar.gz")
sha256sums=('7103852fcb91c45c7125083da94b2cf791cbe66ffd8133f4dbc847e305c4bb9d')

prepare() {
	cd "tekore-${pkgver}"
}

build() {
	cd "tekore-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "tekore-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
