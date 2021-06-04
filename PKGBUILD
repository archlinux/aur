# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>
pkgname=kikit-git
pkgdesc="KiKit is a Python library and CLI tool to automate several tasks in a standard KiCAD"
pkgver=r196.be2b3fc
pkgrel=1

url="https://github.com/yaqwsx/KiKit.git"

arch=("any")
provides=("kikit")
license=("MIT")

source=("$pkgname::git+https://github.com/yaqwsx/KiKit.git")
md5sums=("SKIP")
makedepends=("python-setuptools")
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
	"python-wxpython"
)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1	

	# install license
	install -Dm 644 LICENCE "$pkgdir"/usr/share/licenses/kikit/LICENSE
}
