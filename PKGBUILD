# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-native
_origpkgname=hatch_native
pkgver=0.1.0
pkgrel=1
pkgdesc="Hatch plugin for Rust builds"
arch=("x86_64")
url='https://pypi.org/project/hatch-rs/'
license=("Apache-2.0")
depends=(
	"python-hatchling"
	"python-packaging"
	"python-pydantic"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
)
source=("https://files.pythonhosted.org/packages/source/h/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('a75a8473336caa1440e40ffdd80a9390910c953ba38bf0a7b875fedf6ab69910')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
