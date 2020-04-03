# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=fontaine
_pyname=py$_pipname
pkgname=python-$_pipname-git
pkgver=1.4.0.r1.g3f58a68
pkgrel=1
pkgdesc='Font analysis tool for determining character/glyph support'
arch=('any')
url="https://github.com/googlefonts/$_pyname"
license=('GPL3')
_py_deps=('fonttools'
          'lxml'
          'pyicu'
          'requests'
          'tabulate')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('git'
             'python-setuptools_scm')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
