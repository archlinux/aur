# Maintainer: TheFeelTrain <the@feeltra.in>

_plugin=comp
pkgname=vsview-${_plugin}
pkgver=0.3.0
pkgrel=2
pkgdesc="A vsview plugin to make comparison backed by Slowpoke Pics"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=("EUPL-1.2")
depends=(
    "vsview"
    "python-httpx"
	"python-pathvalidate"
	"python-jinja"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
    "python-versioningit"
)
source=("${pkgname}::git+${url}.git#tag=${_plugin}/v${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${pkgname}/src/plugins/${_plugin}"
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}