# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-skia-pathops-git
pkgver=0.7.4.r4.g2e7c322
pkgrel=1
pkgdesc='Python bindings for the Skia librarys Path Ops'
url='https://github.com/fonttools/skia-pathops'
license=('BSD')
arch=(any)
depends=(cython
         python)
checkdepends=(python-pytest
             python-coverage
             python-pytest-xdist
             python-pytest-randomly)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel
              git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
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

