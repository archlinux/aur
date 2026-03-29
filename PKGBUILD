# Maintainer: TheFeelTrain <the@feeltra.in>

_plugin=comp
pkgname=vsview-${_plugin}
pkgver=0.5.0
pkgrel=1
pkgdesc="A vsview plugin to make comparison backed by Slowpoke Pics"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=("MIT")
depends=(
    "vsview"
    "python-niquests"
	"python-pathvalidate"
	"python-jinja"
	"python-anyio"
	"python-keyring"
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
sha256sums=('43f27860ae67aae84f6c4e5f0000b0c42a059e4dee6af6fcca4df6816a8e57e5')

package() {
	cd "${pkgname}/src/plugins/${_plugin}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
