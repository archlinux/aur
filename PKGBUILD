# Maintainer: Renato Caldas <renato@calgera.com>
_name=kicadmodtree
pkgname="python-${_name}-git"
pkgver=v1.1.2.r226.c289ce71
pkgrel=1
pkgdesc="KiCad Footprint Generator, creating kicad footprints using python scripts"
arch=('any')
url="https://gitlab.com/kicad/libraries/kicad-footprint-generator"
license=('GPL')
depends=('python-pyyaml' 'python-future')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_name}::git+https://gitlab.com/kicad/libraries/kicad-footprint-generator.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_name}"
    python setup.py build
}

check() {
	cd "$srcdir/${_name}"
    pytest -vv
}

package() {
	cd "$srcdir/${_name}"
    python setup.py install --root="$pkgdir" --optimize=1
}
