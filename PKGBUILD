# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-booleanoperations-git
pkgver=0.9.0.r3.g25f7091
pkgrel=1
pkgdesc='Boolean operations on paths'
url='https://github.com/typemytype/booleanOperations'
license=('MIT')
arch=(any)
_pydeps=(pyclipper
         fonttools)
depends=(python
         "${_pydeps[@]/#/python-}")
checkdepends=(python-defcon
              python-fontpens
              python-pytest)
makedepends=(python-setuptools-scm
             git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build -wn
}

check() {
    cd "$pkgname"
    PYTHONPATH=Lib pytest tests
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

