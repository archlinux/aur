# Maintainer: Renato Caldas <renato@calgera.com>
_name=kicadmodtree
pkgname="python-${_name}-git"
pkgver=v1.1.2.r3307.401a7c67d
pkgrel=1
pkgdesc="KiCad Footprint Generator, creating kicad footprints using python scripts"
arch=('any')
url="https://gitlab.com/kicad/libraries/kicad-footprint-generator"
license=('GPL')
depends=('python-asteval' 'python-typing_extensions' 'python-pyyaml' 'python-future'
    'python-tabulate' 'python-pyclipper')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
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
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_name}"
    pytest -vv
}

package() {
    cd "$srcdir/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
