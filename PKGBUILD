# Maintainer: Jon Schlipf <jschlipf@gmx.com>
pkgname=python-gdsfactory
_origpkgname=gdsfactory
pkgver=9.48.0
pkgrel=1
pkgdesc="python library to generate GDS layouts"
arch=("x86_64")
url='https://pypi.org/project/gdsfactory/'
license=("None")
depends=(
	"python-toolz"
	"python-kfactory"
	"python-aenum"
	"python-networkx"
	"python-graphviz"
	"python-trimesh"
	"python-orjson"
	"python-shapely"
	"python-flit-core"
  )
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/d2/66/593cac08cf056f5d43b18ed5aba4f3da689731992dd1e28cc59c4f59278d/gdsfactory-9.48.0.tar.gz")
sha256sums=('3fe3b23d77545f1ad33a217f393e92cccc5024ea43b24c3cfd5c0f4d2921f011')
prepare() {
  cd "${_origpkgname}-${pkgver}" || exit
  sed -i 's/flit_core >=3\.2,<4/flit_core >=3.2/' pyproject.toml
}
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
