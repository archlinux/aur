# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate
# Previous Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>

pkgname=python-tekore
pkgver=5.5.1
pkgrel=1
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
sha256sums=('653ac35cb80a88567ee2b2e8aeb5946f3776958fc35c42ca9b56fe2355e19b10')

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
