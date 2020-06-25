# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=babelfont
pkgname=python-$_pipname-git
pkgver=0.0.2.r0.g7ae5cc4
pkgrel=1
pkgdesc='Interrogate and manipulate UFO, TTF and OTF fonts with a common interface'
arch=('any')
url="https://github.com/simoncozens/$_pipname"
license=('MIT')
_py_deps=('defcon'
          'fontparts'
          'fonttools')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
