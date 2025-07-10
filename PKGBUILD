# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: Julian Daube <joposter at gmail dot com>
pkgname=kikit-git
pkgdesc="Automation for KiCAD boards"
pkgver=r751.4f1a424
pkgrel=3

url="https://github.com/yaqwsx/KiKit.git"

arch=("any")
provides=("kikit")
license=("MIT")
conflicts=("python-kikit")

source=("$pkgname::git+https://github.com/yaqwsx/KiKit.git")
md5sums=("SKIP")
makedepends=(
	"python-setuptools" 
	"python-versioneer"
	"python-build"
	"python-installer"
)
depends=(
	"kicad>=5.1.0"
	"python-shapely"
	"python-solidpython"
	"python-numpy"
	"python-click"
	"python-markdown2"
	"python-commentjson"
	"python-matplotlib"
	"python-pybars3"
	"python-pcbnewtransition"
)
optdepends=("python-wxpython: for plugin hideReferences")


pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	# install license
	install -Dm 644 LICENCE "$pkgdir"/usr/share/licenses/kikit/LICENSE
}
