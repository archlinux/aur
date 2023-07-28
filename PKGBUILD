pkgname=('python-svg2mod-git')
pkgver=r240.d9b5dd0
pkgrel=1
pkgdesc="Convert Inkscape SVG drawings to KiCad footprint modules"
url="https://github.com/svg2mod/svg2mod"
depends=()
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pytest-runner' 'python-pytest-pylint')
depends=('python' 'python-fonttools')
license=('GPL2')
arch=('any')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=('python-svg2mod')
conflicts=('python-svg2mod')

pkgver() {
    cd "$pkgname"
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${pkgname}
	python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
