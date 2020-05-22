# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>
pkgname=kikit-git
pkgdesc="KiKit is a Python library and CLI tool to automate several tasks in a standard KiCAD"
pkgver=r65.c76c51e
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
	"python-markdown2" 
	"python-numpy"
	"python-shapely"
	"python-click"
	"python-pybars3"
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
