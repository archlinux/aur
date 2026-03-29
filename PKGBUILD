# Maintainer: TheFeelTrain <the@feeltra.in>

_plugin=split-planes
pkgname=vsview-${_plugin}
pkgver=0.1.3.post1
pkgrel=1
pkgdesc="A vsview plugin displaying video clips' constituent planes"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=("MIT")
depends=(
    "vsview"
    "vapoursynth-plugin-vsakarin"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("${pkgname}::git+${url}.git#tag=${_plugin}/v${pkgver}")
sha256sums=('29df31751bb645f14f68c2c3c1813bb6c40899aa36a06650acffe151db8aa0fb')

package() {
	cd "${pkgname}/src/plugins/${_plugin}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
